//
//  MapViewController.m
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "MapViewController.h"
#import "KnowledgeContentViewController.h"


@interface MapViewController()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMap:(UIStoryboardSegue *)segue{
}


//adding stuff
- (IBAction)startWalkthrough:(id)sender {
    
    _pageImages = @[@"page1", @"page2"];
    
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KnowledgePageViewController"];
    self.pageViewController.dataSource = self;
    
    KnowledgeContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}



//might need to be adjusting names...
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((KnowledgeContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((KnowledgeContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    return [self viewControllerAtIndex:index];
}


- (KnowledgeContentViewController *)viewControllerAtIndex:(NSUInteger)index
{

    
    // Create a new view controller and pass suitable data.
    KnowledgeContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KnowledgeContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (NSInteger)presentationCountForKnowledgeViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImages count];
}

- (NSInteger)presentationIndexForKnowledgeViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end