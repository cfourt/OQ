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
    [self updateCurrentPosition];
    [myVariables sharedGameData].map = self;
    [self initPercival];
}

- (void) viewDidAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = true;
    [[myVariables sharedGameData] save];
    [self hoverLabels:_proceedLabel withTime:0.8f x:0 y:5];
    [self hoverLabels:_backButton withTime:2.f x:3 y:0];
    [self updateCurrentPosition];

}

- (void) initPercival{
    int xPos = [[myVariables sharedGameData].positionArrayX[[myVariables sharedGameData].currentQuestionInt] intValue];
    int yPos = [[myVariables sharedGameData].positionArrayY[[myVariables sharedGameData].currentQuestionInt] intValue];
    int percivalSizeX = 135;
    int percivalSizeY = 72;
    _percival.frame = CGRectMake(xPos, yPos, percivalSizeX, percivalSizeY);
}

- (void) hoverLabels:(UIView*) element withTime:(float) time x:(int)x y:(int)y{
    
    CGPoint startPoint = (CGPoint){element.center.x, element.center.y};
    CGPoint endPoint = (CGPoint){startPoint.x + x,startPoint.y + y};
    
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath, NULL, startPoint.x, startPoint.y);
    CGPathAddLineToPoint(thePath, NULL, endPoint.x, endPoint.y);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = time;
    animation.path = thePath;
    animation.autoreverses = YES;
    animation.repeatCount = INFINITY;
    [element.layer addAnimation:animation forKey:@"position"];
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
    
    int percivalSizeX = 135;
    int percivalSizeY = 72;
    _percival.frame = CGRectMake(xPos, yPos, percivalSizeX, percivalSizeY);
    
    /*
     if (_mapPosition != currentQuestion){
     [self animatePercival];
     }
     */
    
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

- (void)goToPosition:(int)pos{
    //should not be called unless the pos is equal to or below the current question
    if (pos <= [myVariables sharedGameData].currentQuestionInt){
        _mapPosition = pos;
        [self updateCurrentPosition];
    }
    else{
        NSLog(@"You done goofed and you called this at the wrong time!");
    }
}

- (BOOL) animatePercival{
    
        int xPos = [[myVariables sharedGameData].positionArrayX[[myVariables sharedGameData].currentQuestionInt] intValue];
        int yPos = [[myVariables sharedGameData].positionArrayY[[myVariables sharedGameData].currentQuestionInt] intValue];
    /*
     This has the proper logic for getting the current position of percival. It needs a sense of history. What might be better is to see if I can update the position inside this function. currently it is being done above in goToPosition at:
     
            _mapPosition = pos;
     
        This is the same logic being used above in the  update current location fuction. 
     
        NSArray* xPositionArray = [myVariables sharedGameData].positionArrayX;
        NSArray* yPositionArray = [myVariables sharedGameData].positionArrayY;
        int xPos = [xPositionArray[_mapPosition] intValue];
        int yPos = [yPositionArray[_mapPosition] intValue];
        
        int percivalSizeX = 135;
        int percivalSizeY = 72;
        _percival.frame = CGRectMake(xPos, yPos, percivalSizeX, percivalSizeY);
    */
    
    
        CGPoint startPoint = (CGPoint){xPos, yPos};
        CGPoint endPoint = (CGPoint){[[myVariables sharedGameData].positionArrayX[[myVariables sharedGameData].currentQuestionInt+1] intValue], [[myVariables sharedGameData].positionArrayY[[myVariables sharedGameData].currentQuestionInt+1] intValue]};
        
        CGMutablePathRef thePath = CGPathCreateMutable();
        CGPathMoveToPoint(thePath, NULL, startPoint.x, startPoint.y);
        CGPathAddLineToPoint(thePath, NULL, endPoint.x, endPoint.y);
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.duration = 0.7f;
        animation.path = thePath;
        animation.autoreverses = NO;
        animation.repeatCount = 0;
        [_percival.layer addAnimation:animation forKey:@"position"];
    return TRUE;
}

@end








