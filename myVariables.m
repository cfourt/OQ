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
    self.numQuestions = (int)[self.answersArray count];
    
    self.positionArrayX = [NSArray arrayWithObjects: [NSNumber numberWithInt:36],[NSNumber numberWithInt:19],[NSNumber numberWithInt:32], [NSNumber numberWithInt:55], [NSNumber numberWithInt:103], [NSNumber numberWithInt:142], [NSNumber numberWithInt:190], [NSNumber numberWithInt:194], [NSNumber numberWithInt:164], [NSNumber numberWithInt:176], nil];
    int yMod = 100;
    self.positionArrayY = [NSArray arrayWithObjects:[NSNumber numberWithInt:(270-yMod)], [NSNumber numberWithInt:(318-yMod)], [NSNumber numberWithInt:(342-yMod)], [NSNumber numberWithInt:(388-yMod)], [NSNumber numberWithInt:(424-yMod)], [NSNumber numberWithInt:(388-yMod)], [NSNumber numberWithInt:(390-yMod)], [NSNumber numberWithInt:(340-yMod)], [NSNumber numberWithInt:(319-yMod)], [NSNumber numberWithInt:(270-yMod)], nil];
   
   
   
    
    
    if (self) {
        _currentQuestionInt = [decoder decodeIntForKey: OQCurrentQuestionKey];

    }
    return self;
}

-(void)save{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[myVariables filePath] atomically:YES];
}

- (int)updateCurrentQuestion:(int)newVal {
    _currentQuestionInt = newVal;
    return _currentQuestionInt;
}

@end