//
//  NMCondicionPicoViewController.m
//  CharruaSurfReport
//
//  Created by norman martinez on 01/09/14.
//  Copyright (c) 2014 NMDevelopment. All rights reserved.
//

#import "NMCondicionPicoViewController.h"

@interface NMCondicionPicoViewController ()

@end

@implementation NMCondicionPicoViewController
@synthesize listaPicos,latitud,longitud,nombrePico,fechaCondicion;
@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.latitud=[NSDecimalNumber :self.latitud];
    //self.longitud=[NSDecimalNumber decimalNumberWithString:self.longitud];
    self.nombrePico=self.nombrePico;
    
    self.listaPicos=[self listadoCondicionesLatitud:self.latitud listadoCondicionesLongitud:self.longitud];
    
    [self setearPageViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Método que setea el PageView
-(void)setearPageViewController
{
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CondicionPageViewController"];
    self.pageViewController.dataSource = self;
    
    NMCondicionPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}

//Recupera el array de condiciones de un pico
-(NSArray *)listadoCondicionesLatitud:(NSDecimalNumber *)lat listadoCondicionesLongitud:(NSDecimalNumber *)lon
{
    NSString *urlAPI =[[NSString alloc]initWithFormat:@"http://api.worldweatheronline.com/free/v1/marine.ashx?key=cf48441cc45eea89cbd259a8c698c4a569fdcb2c&q=%@,%@&format=json",(NSString *)lat,(NSString *)lon];
    
    NSURL *url=[NSURL URLWithString:urlAPI];
    NSError *error=nil;
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *nivelBase=[NSJSONSerialization
                             JSONObjectWithData:data
                             options:NSJSONReadingMutableContainers
                             error:&error];
    
    NSDictionary *nivel1 = [nivelBase objectForKey:@"data"];
    NSArray *nivel2 = [nivel1 objectForKey:@"weather"];
    NSDictionary *nivel3 =[nivel2 objectAtIndex:0];
    self.fechaCondicion=[nivel3 objectForKey:@"date"];
    NSMutableArray *nivel4 =[nivel3 objectForKey:@"hourly"];
    [nivel4 removeObjectAtIndex:0];
    return (NSArray *)nivel4;
}


#pragma mark - Page View Controller Data Source

//Paso un Pico al PageView
- (NMCondicionPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.listaPicos count] == 0) || (index >= [self.listaPicos count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    NMCondicionPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CondicionPageContentViewController"];
    
    pageContentViewController.pico=[self.listaPicos objectAtIndex:index];
    pageContentViewController.nombrePico=self.nombrePico;
    pageContentViewController.latitud=self.latitud;
    pageContentViewController.longitud=self.longitud;
    pageContentViewController.pageIndex = index;
    pageContentViewController.fechaCondicion=self.fechaCondicion;
    
    return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((NMCondicionPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((NMCondicionPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.listaPicos count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.listaPicos count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
