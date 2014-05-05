//
//  myVariables.h
//  OrganicQuest
//
//  Created by Connor Fourt on 3/28/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface myVariables : NSObject <NSCoding>

@property (getter = theCurrentQuestionIs) int currentQuestionInt;
@property (getter = numQuestionsIs) int numQuestions;
@property (getter = answerIs) NSArray* answersArray;
@property NSArray* positionArrayY;
@property NSArray* positionArrayX;

- (int)decrementCurrentQuestion:(id)sender;
- (int)incrementCurrentQuestion:(id)sender;
+ (instancetype)sharedGameData;
- (void)save;

@end
