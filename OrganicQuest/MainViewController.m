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

- (IBAction)reset:(id)sender {
    [[myVariables sharedGameData] updateCurrentQuestion:0];
    UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle: @"Reset" message:@"Set to zero" delegate:nil cancelButtonTitle:@"Sweet!" otherButtonTitles: nil ];
    [myAlert show];
}

- (void) viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = true;
    [self hoverStartButton];

}

- (void) hoverStartButton{
        CGPoint startPoint = (CGPoint){self.startButton.center.x, self.startButton.center.y};
        CGPoint endPoint = (CGPoint){startPoint.x, startPoint.y + 5};
        
        CGMutablePathRef thePath = CGPathCreateMutable();
        CGPathMoveToPoint(thePath, NULL, startPoint.x, startPoint.y);
        CGPathAddLineToPoint(thePath, NULL, endPoint.x, endPoint.y);
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.duration = 1.5f;
        animation.path = thePath;
        animation.autoreverses = YES;
        animation.repeatCount = INFINITY;
        [self.startButton.layer addAnimation:animation forKey:@"position"];
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
