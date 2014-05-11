//
//  MapViewController.m
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"
#import "myVariables.h"

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


- (IBAction)godminus:(id)sender {
    NSLog(@" it was %d", [myVariables sharedGameData].currentQuestionInt);
    [myVariables sharedGameData].currentQuestionInt --;
    NSLog(@" now it's %d", [myVariables sharedGameData].currentQuestionInt);

}

- (IBAction)godPlus:(id)sender {
    NSLog(@" it was %d", [myVariables sharedGameData].currentQuestionInt);
    [myVariables sharedGameData].currentQuestionInt ++;
    NSLog(@" now it's %d", [myVariables sharedGameData].currentQuestionInt);
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _mapPosition = [myVariables sharedGameData].currentQuestionInt;
    [self updateCurrentPosition];
}

- (void) viewDidAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = true;
    [self updateCurrentPosition];
    [[myVariables sharedGameData] save];

}

- (BOOL)prefersStatusBarHidden{
    return true;
}

-(void)updateCurrentPosition{
    //local storage
    int currentQuestion = [myVariables sharedGameData].currentQuestionInt;
    
    //update labels
    self.currentLocationLabel.text = [NSString stringWithFormat:@"%d", (_mapPosition +1)];
    self.outOf.text = [NSString stringWithFormat:@"/%d", [myVariables sharedGameData].numQuestions];

    //render Percival
    NSArray* xPositionArray = [myVariables sharedGameData].positionArrayX;
    NSArray* yPositionArray = [myVariables sharedGameData].positionArrayY;

    int xPos = [xPositionArray[_mapPosition] intValue];
    int yPos = [yPositionArray[_mapPosition] intValue];
    
    _percival.frame = CGRectMake(xPos, yPos, 135, 72);
    
    NSLog(@"map position: %d", (int)_mapPosition);
    NSLog(@"current question: %d", currentQuestion);
    
    //Change label based on if the current question will be selected
    if ((int)_mapPosition == currentQuestion) {
        [self.proceedLabel setImage:[UIImage imageNamed:@"Proceed-To-Next--3.png"] forState:UIControlStateNormal];
        self.proceedLabel.userInteractionEnabled = true;

    }
    else{
        [self.proceedLabel setImage:[UIImage imageNamed:@"previous.png"] forState:UIControlStateNormal];
        self.proceedLabel.userInteractionEnabled = false;

    }
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToMap:(UIStoryboardSegue *)segue{}

- (IBAction)incrementCurrentQuestion:(id)sender {
    NSLog(@"Num Questions:%d,mapPos: %d,CurrentQuestion: %d ", [myVariables sharedGameData].numQuestions, _mapPosition, [myVariables sharedGameData].currentQuestionInt);
    if ((_mapPosition + 1) < ([myVariables sharedGameData].numQuestions) && (_mapPosition < [myVariables sharedGameData].currentQuestionInt)) {
        _mapPosition++;
    }
    [self updateCurrentPosition];
}

- (IBAction)decrementCurrentQuestion:(id)sender {
    NSLog(@"Num Questions:%d,mapPos: %d,CurrentQuestion: %d ", [myVariables sharedGameData].numQuestions, _mapPosition, [myVariables sharedGameData].currentQuestionInt);
    if ([self.currentLocationLabel.text integerValue] > 1) {
        _mapPosition --;
    }
    [self updateCurrentPosition];
}

@end