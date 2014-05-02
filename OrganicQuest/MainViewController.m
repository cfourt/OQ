//
//  MainViewController.m
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "MainViewController.h"
#import "ProjectVariables.h"
#import "myVariables.h"
#import "UIProgressViewHomeProgress.h"

@interface MainViewController ()
@end

@implementation MainViewController

-(IBAction)unWindToStartMenu:(UIStoryboardSegue *)seque{}

- (void)viewDidLoad
{
    [super viewDidLoad];
                                   
};

-(BOOL)prefersStatusBarHidden{
    return true;
}

- (void) viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = true;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
