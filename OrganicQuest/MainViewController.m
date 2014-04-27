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
   /* int progress = [myVariables sharedGameData].currentQuestionInt / [myVariables sharedGameData].numQuestions;
    UIProgressViewHomeProgress *progressBar = [[UIProgressView init] alloc];
    progressBar.progress = progress;*/

};

- (void) viewDidAppear:(BOOL)animated{
    
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

/*
 
 self.currentProgress.progress = [self getCurrentPos];
 }
 
 - (void)sendSubviewToBack:(UIView *)view{
 
 }
 
 - (float) getCurrentPos{
 
 float floatme  = [myVariables sharedGameData].currentQuestionInt / [myVariables sharedGameData].numQuestions;
 self.currentProgress.progress = floatme;
 NSLog([NSString stringWithFormat:@"current question: %f", [myVariables sharedGameData].currentQuestionInt]);
 NSLog([NSString stringWithFormat:@"num quesitons: %f", [myVariables sharedGameData].numQuestions]);
 NSLog([NSString stringWithFormat:@"current position: %f", floatme]);
 return floatme;
 }
 
 - (IBAction)showCurrentProgress:(id)sender{
 float currentPos = [self getCurrentPos ];
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current Status" message:[NSString stringWithFormat:@"Your current position is %f", currentPos] delegate:nil cancelButtonTitle:@"Sweet" otherButtonTitles: nil];
 [alert show];
 }
 */