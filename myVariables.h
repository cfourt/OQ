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

- (int)decrementCurrentQuestion:(id)sender;
- (int)incrementCurrentQuestion:(id)sender;

/*
+ (int) numQuestions;

//wtf does this do?
+ (int)automaticallyNotifiesObserversOfCurrentQuestionInt;
*/
@end
