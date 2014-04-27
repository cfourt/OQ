//
//  myVariables.m
//  OrganicQuest
//
//  Created by Connor Fourt on 3/28/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "myVariables.h"

@implementation myVariables


NSString* OQCurrentQuestionKey = @"currentQuestion";

- (int) numQuestions{
    _numQuestions = 10;
    return _numQuestions;
}

/*
- (instancetype)init
{
    self = [super init];
    if (self) {
        //well this is rad...
    }
    return self;
}
*/

+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}


- (int)incrementCurrentQuestion:(id)sender {
    if (_currentQuestionInt < 10) {
    _currentQuestionInt++;
    NSLog (@"%d", _currentQuestionInt);
    }
    return _currentQuestionInt;
}

- (int)decrementCurrentQuestion:(id)sender {
    if (_currentQuestionInt > 0) {
        _currentQuestionInt --;
        NSLog (@"%d", _currentQuestionInt);
    }
    return _currentQuestionInt;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInt:_currentQuestionInt forKey: OQCurrentQuestionKey];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [self init];
    if (self) {
        _currentQuestionInt = [decoder decodeIntegerForKey: OQCurrentQuestionKey];
        NSLog([NSString stringWithFormat:@"_currentQuesitonInt = %d", _currentQuestionInt]);
    }
    return self;
}

-(void)save
{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[myVariables filePath] atomically:YES];
}

+(instancetype)loadInstance {
    NSData* decodedData = [NSData dataWithContentsOfFile: [myVariables filePath]];
    if (decodedData) {
        myVariables* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    return [[myVariables alloc] init];
}

+(NSString*)filePath {
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}

- (int)updateCurrentQuestion:(int)newVal {
    _currentQuestionInt = newVal;
    return _currentQuestionInt;
}


@end