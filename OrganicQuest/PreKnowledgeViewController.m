//
//  PreKnowledgeViewController.m
//  OrganicQuest
//
//  Created by Connor Fourt on 3/2/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "PreKnowledgeViewController.h"
#import "MainViewController.h"
#import "myVariables.h"
#import "UIImageViewQuestion.h"

@interface PreKnowledgeViewController ()

@end

@implementation PreKnowledgeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *questionsArray = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"Question1.png"],
                               [UIImage imageNamed:@"Question2.png"],
                               nil];
    

    
    NSLog(@"We're in the PreKnowledgeViewController Bro! The current question is: %d", [myVariables sharedGameData].currentQuestionInt);

    UIImageViewQuestion *imageView = [[UIImageViewQuestion alloc] initWithImage:questionsArray[[myVariables sharedGameData].currentQuestionInt]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    imageView.frame = CGRectMake(0,70, 320, 504);
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = true;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToQuestion:(UIStoryboardSegue *)segue{}

@end
