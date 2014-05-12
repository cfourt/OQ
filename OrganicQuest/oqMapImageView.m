//
//  oqMapImageView.m
//  OrganicQuest
//
//  Created by Connor Fourt on 5/4/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "oqMapImageView.h"
#import "myVariables.h"
#import "MapViewController.h"

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
    
    //if touch is near a certain point, and if that point is available, move percival to that point.
    NSNumber *x = [NSNumber numberWithDouble:touchPoint.x];
    NSNumber *y = [NSNumber numberWithDouble:touchPoint.y];
    
    int xMod = 70;
    int yMod = 45;
    for (int i=0; i <= [myVariables sharedGameData].currentQuestionInt; i++) {
        int currentX = [[myVariables sharedGameData].positionArrayX[i] intValue]+xMod;
        int currentY = [[myVariables sharedGameData].positionArrayY[i] intValue]+yMod;
        if(([x intValue]> (currentX - currentX*.05) && ([x intValue]<(currentX + currentX*.05))) && ([y intValue]> (currentY - currentY*.05)) && ([y intValue]< (currentY + currentY*.05))){
            //do shit
            NSLog(@"This touch corresponds to point: %d", i) ;
            MapViewController* map = [myVariables sharedGameData].map;
            [map goToPosition:i];
        }
        
    }
    
}

@end
