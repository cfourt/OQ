//
//  myVariables.m
//  OrganicQuest
//
//  Created by Connor Fourt on 3/28/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "myVariables.h"

@implementation myVariables

//static int currentQuestionStaticInt =0 ;
//static int numQuestions = 10 ;
NSString* OQCurrentQuestionKey = @"currentQuestion";


- (int) numQuestions{
    return _numQuestions;
}

/*+ (int) automaticallyNotifiesObserversOfCurrentQuestionInt{
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
*/

- (int)incrementCurrentQuestion:(id)sender {
    //if (currentQuestionStaticInt < 10) {
    _currentQuestionInt++;
    NSLog (@"%d", _currentQuestionInt);
    //}
    return _currentQuestionInt;
}

- (int)decrementCurrentQuestion:(id)sender {
    if (_currentQuestionInt > 0) {
        _currentQuestionInt --;
        NSLog (@"%d", _currentQuestionInt);
    }
    return _currentQuestionInt;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInt:_currentQuestionInt forKey: OQCurrentQuestionKey];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _currentQuestionInt = [decoder decodeDoubleForKey: OQCurrentQuestionKey];
    }
    return self;
}

+(instancetype)loadInstance
{
    NSData* decodedData = [NSData dataWithContentsOfFile: [myVariables filePath]];
    if (decodedData) {
        myVariables* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    return [[myVariables alloc] init];
}


+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}

- (int)updateCurrentQuestion:(int)newVal{
    _currentQuestionInt = newVal;
    return _currentQuestionInt;
}


@end