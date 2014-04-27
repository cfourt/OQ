//
//  MapViewController.m
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"

@interface MapViewController()

@end

@implementation MapViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //NSLog (@"The currentQuestionLabel in MapViewController is about to be set to: %d", [myVariables sharedGameData].currentQuestionInt);
    [self printCurrentStatus];
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d", [myVariables sharedGameData].currentQuestionInt];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToMap:(UIStoryboardSegue *)segue{}
- (IBAction)incrementCurrentQuestion:(id)sender {
    
    NSLog(@"the currentQuestionLabel is %@", self.currentLocationLabel.text);
    [self printCurrentStatus];
    if ([self.currentLocationLabel.text integerValue] < [myVariables sharedGameData].numQuestions) {
        [myVariables sharedGameData].currentQuestionInt ++;
        NSLog(@"the value of globalVariables.currenQuestionInt was updated to %d", [myVariables sharedGameData].currentQuestionInt);
    }
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d",[myVariables sharedGameData].currentQuestionInt];
    [[myVariables sharedGameData] save];
    [self printCurrentStatus];
}
- (IBAction)decrementCurrentQuestion:(id)sender {
    
    NSLog(@"the currentQuestionLabel is %@", self.currentLocationLabel.text);
    [self printCurrentStatus];
    if (![self.currentLocationLabel.text  isEqualToString: @"0"]) {
    [myVariables sharedGameData].currentQuestionInt --;
    NSLog(@"the value of globalVariables.currenQuestionInt was updated to %d", [myVariables sharedGameData].currentQuestionInt);
    }
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d",[myVariables sharedGameData].currentQuestionInt];
    [[myVariables sharedGameData] save];
    [self printCurrentStatus];
    
}


//helper functions
- (void)printCurrentStatus{
    NSLog([NSString stringWithFormat:@"current question was saved to %d and the current label displays %@", [myVariables sharedGameData].currentQuestionInt,self.currentLocationLabel.text]);
}
@end