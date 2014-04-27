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

+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
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
    self.answersArray = @[@1,@3,@1,@2,@4,@2,@2,@3,@4,@1];
    self.numQuestions = sizeof(self.answersArray);
    NSLog([NSString stringWithFormat:@"the number of questions is set to: %d"], _numQuestions);
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

- (int)updateCurrentQuestion:(int)newVal {
    _currentQuestionInt = newVal;
    return _currentQuestionInt;
}



@end