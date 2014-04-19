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
static int numQuestions = 10 ;

+ (int) currentQuestionStaticInt{
    return currentQuestionStaticInt;
}
+ (int) numQuestions{
    return numQuestions;
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