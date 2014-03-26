//
//  PreKnowledgeViewController.m
//  OrganicQuest
//
//  Created by Connor Fourt on 3/2/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "PreKnowledgeViewController.h"
#import "MainViewController.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *answersArray = @[@1,@3,@1,@2,@4,@2,@2,@3,@4,@1];
    NSArray *questionsArray = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"Question1.png"],
                               [UIImage imageNamed:@"Question2.png"],
                               nil];
    
    //creating the image view within Pre-KnowledgeView Controller
    //this will hold the question
    UIImageView *imageView = [[UIImageView alloc] initWithImage:questionsArray[1]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;

    imageView.frame = CGRectMake(0,
                                 70, 320, 504);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToQuestion:(UIStoryboardSegue *)segue{
}

@end
