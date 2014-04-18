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

    NSLog (@"The currentQuestionLabel in MapViewController is about to be set to: %d", [myVariables currentQuestionStaticInt]);
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d", [myVariables currentQuestionStaticInt]];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToMap:(UIStoryboardSegue *)segue{}
- (IBAction)incrementCurrentQuestion:(id)sender {
    
    NSLog(@"the currentQuestionLabel is %@", self.currentLocationLabel.text);
    NSLog(@"the current value of currentQuestionStaticInt is %d", [myVariables currentQuestionStaticInt]);
    if ([self.currentLocationLabel.text integerValue] < 10) {
        [myVariables incrementCurrentQuestion:(self)];
        NSLog(@"the value of globalVariables.currenQuestionInt was updated to %d", [myVariables currentQuestionStaticInt]);
    }
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d",[myVariables currentQuestionStaticInt]];
    NSLog([NSString stringWithFormat:@"text was updated to %@", self.currentLocationLabel.text]);
}
- (IBAction)decrementCurrentQuestion:(id)sender {
    
    NSLog(@"the currentQuestionLabel is %@", self.currentLocationLabel.text);
    NSLog(@"the current value of currentQuestionStaticInt is %d", [myVariables currentQuestionStaticInt]);
    if (![self.currentLocationLabel.text  isEqualToString: @"0"]) {
    [myVariables decrementCurrentQuestion:(self)];
    NSLog(@"the value of globalVariables.currenQuestionInt was updated to %d", [myVariables currentQuestionStaticInt]);
    }
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d",[myVariables currentQuestionStaticInt]];
    NSLog([NSString stringWithFormat:@"text was updated to %@", self.currentLocationLabel.text]);
    
}
@end