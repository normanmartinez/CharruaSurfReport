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
@synthesize pageTitles;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Ejemplo .... quitar
    self.pageTitles = @[@"Hoja 1", @"Hoja 2", @"Hoja 3", @"Hoja 4"];
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

//Asigna las propiedades del CondicionPageContentViewController
- (NMCondicionPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    NMCondicionPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CondicionPageContentViewController"];
    
    //aca tengo que pasar el dato del pico (lo que viene de la otra pantalla + el JSON
  
    pageContentViewController.titleText = self.pageTitles[index];
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

-(void)recuperaCondiciones:(Pico *) picoActual
{
    NSString *urlAPI =[[NSString alloc]initWithFormat:@"http://api.worldweatheronline.com/free/v1/marine.ashx?key=cf48441cc45eea89cbd259a8c698c4a569fdcb2c&q=%@,%@&format=json",(NSString *)picoActual.latitud,(NSString *)picoActual.longitud];
    
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
    NSArray *nivel4 =[nivel3 objectForKey:@"hourly"];
    
    for (int aux=0; aux <[nivel4 count]; aux++)
    {
        NSDictionary *nivel5 =[nivel4 objectAtIndex:aux];
        NSLog(@"%@",[nivel5 valueForKey:@"humidity"]);
    }
}

#pragma mark - Page View Controller Data Source

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
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
