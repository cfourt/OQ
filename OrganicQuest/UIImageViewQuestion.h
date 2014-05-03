//
//  UIImageViewQuestion.h
//  OrganicQuest
//
//  Created by Connor Fourt on 4/18/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageViewQuestion : UIImageView <UIAlertViewDelegate>

@property (atomic, getter = touchOccuredHere, weak) UITouch* questionTouch;
@property (nonatomic, strong) NSNumber* gotTheAnswer;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
