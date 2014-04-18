//
//  myVariables.m
//  OrganicQuest
//
//  Created by Connor Fourt on 3/28/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "myVariables.h"

@implementation myVariables

static int currentQuestionStaticInt =0 ;

+ (int) currentQuestionStaticInt{
    return currentQuestionStaticInt;
}


+ (int) automaticallyNotifiesObserversOfCurrentQuestionInt{
    NSLog(@"%d", currentQuestionStaticInt);
    return currentQuestionStaticInt;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //well this is rad...
    }
    return self;
}

+ (int)incrementCurrentQuestion:(id)sender {
    //if (currentQuestionStaticInt < 10) {
        currentQuestionStaticInt ++;
        NSLog (@"%d", currentQuestionStaticInt);
    //}
    return currentQuestionStaticInt;
}

+ (int)decrementCurrentQuestion:(id)sender {
    if (currentQuestionStaticInt > 0) {
        currentQuestionStaticInt --;
        NSLog (@"%d", currentQuestionStaticInt);
    }
    return currentQuestionStaticInt;
}

@end



/* should be able to access this all I want with a setter.
 - (void) resetCurrentQuestionToZero{
 _currentQuestionInt =0;
 }
 */
/* Attempting to make a super jank static method to access the variable
 static int currentQuestionIs(int newVal){
 static int question = 0;
 if (newVal ==0) {
 return question;
 }
 else {
 question = newVal;
 return question;
 }
 }
 */