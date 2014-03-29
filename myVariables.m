//
//  myVariables.m
//  OrganicQuest
//
//  Created by Connor Fourt on 3/28/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "myVariables.h"

@implementation myVariables

- (void) resetCurrentQuestionToZero{
    currentQuestion =0;
}

- (NSInteger) currentQuestion
{
    return currentQuestion;
}
- (NSInteger) numQuestions{
    return numQuestions;
}


@end
