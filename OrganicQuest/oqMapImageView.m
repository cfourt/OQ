//
//  oqMapImageView.m
//  OrganicQuest
//
//  Created by Connor Fourt on 5/4/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "oqMapImageView.h"
#import "myVariables.h"


@implementation oqMapImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:nil];
    NSLog(@"X: %f, Y: %f",touchPoint.x, touchPoint.y);

}

@end
