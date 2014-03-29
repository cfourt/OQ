//
//  myVariables.h
//  OrganicQuest
//
//  Created by Connor Fourt on 3/28/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myVariables : NSObject{
    NSInteger currentQuestion;
    NSInteger numQuestions;
}

-   (NSInteger) currentQuestion;
- (NSInteger) numQuestions;
- (void) resetCurrentQuestionToZero;

@end
