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
        self.gotTheAnswer = false;
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
    if (touchPoint.y > 270) {
        if (touchPoint.y < 397) {
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
    }
    else{
        chosenAnswer =5;
    }//else they touched above the answer options
    
    //check if they got it right
    
    NSArray *localArray = [myVariables sharedGameData].answersArray;
    NSNumber *correctAnswer = localArray[[myVariables sharedGameData].currentQuestionInt];
    NSNumber *userAnswer = [NSNumber numberWithInt:chosenAnswer];
    
    if (userAnswer == correctAnswer && ![_gotTheAnswer  isEqual: @1]) { // need to add convert to integer here?
        _gotTheAnswer = @1;
        [myVariables sharedGameData].currentQuestionInt ++;
        
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle: @"You got it!" message:@"You've unlocked the next challenge." delegate:nil cancelButtonTitle:@"Sweet!" otherButtonTitles: nil ];
        [myAlert show];
        [_preKnowledgeViewController.navigationController popViewControllerAnimated:true];
        
    }
    else if (chosenAnswer ==5){
        NSLog(@"you chose the question");
    }
    else if ([_gotTheAnswer isEqual:@1]){
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle: @"You already got the answer" message:@"Head back to the map for more." delegate:nil cancelButtonTitle:@"Rad" otherButtonTitles: nil ];
        [myAlert show];
    }
    else{
        //they didn't get it right!
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Oh No!" message: @"Unfortunately you got the wrong answer. Chcek out the explaination by tapping no clue..." delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles: nil];
        [myAlert show];

    }
    
}

- (void)waitToUpdate:(UIAlertView *)myAlert didDismissWithButtonIndex:(NSInteger)buttonIndex{
 //I can do things in here that will wait for the alert view to be dismissed. 
}

- (void)myAlert:(UIAlertView *)myAlert didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}



@end
