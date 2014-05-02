//
//  UIImageViewQuestion.m
//  OrganicQuest
//
//  Created by Connor Fourt on 4/18/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "UIImageViewQuestion.h"
#import "myVariables.h"
#import "MapViewController.h"
#import "PreKnowledgeViewController.h"

@implementation UIImageViewQuestion 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    int chosenAnswer=0;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:nil];
    NSLog(@"X: %f, Y: %f",touchPoint.x, touchPoint.y);
    
    // which answer did they choose?
    if (touchPoint.y > 283) {
        if (touchPoint.y < 400) {
            if (touchPoint.x > 160){
                chosenAnswer = 2;
            }
            else {
                chosenAnswer =1;
            }
        }
        else{ //touchPoint == 1,2
            if (touchPoint.x > 160){
                chosenAnswer = 4;
            }
            else {
                chosenAnswer =3;
            }
        }
    } //else they touched above the answer options
    
    //check if they got it right
    
    NSArray *localArray = [myVariables sharedGameData].answersArray;
    NSNumber *correctAnswer = localArray[[myVariables sharedGameData].currentQuestionInt];
    NSNumber *userAnswer = [NSNumber numberWithInt:chosenAnswer];
    
   // NSLog([NSString stringWithFormat:@"correct answer: %@", correctAnswer]);
   // NSLog([NSString stringWithFormat:@"user answer: %@", userAnswer]);
    
    if (userAnswer == correctAnswer) { // need to add convert to integer here?

        [myVariables sharedGameData].currentQuestionInt ++;
        
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle: @"You got it!" message:@"Way to go. Head back to the previous page for the next challenge." delegate:nil cancelButtonTitle:@"Sweet!" otherButtonTitles: nil ];
        [myAlert show];
        
        //need to add return to maps after popping the message box. In the mean time, I can just give them directions to go back and see that they have indeed moved forward.
    }
    else{
        //they didn't get it right!
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Oh No!" message: @"Unfortunately you got the wrong answer. Chcek out the explaination by tapping No Clue..." delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles: nil];
        [myAlert show];

    }
   // NSLog([NSString stringWithFormat:@"The value of currentQuestion is: %d", [myVariables sharedGameData].currentQuestionInt]);
    
    //[[[MapViewController alloc]init] performSegueWithIdentifier:@"backToMap" sender:self];
}

- (void)waitToUpdate:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
 //I can do things in here that will wait for the alert view to be dismissed. 
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
