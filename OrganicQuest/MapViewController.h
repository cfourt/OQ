//
//  MapViewController.h
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KnowledgeContentViewController.h"


@interface MapViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *currentPosition;
@property (weak, nonatomic) IBOutlet UILabel *currentLocationLabel;
- (IBAction)incrementCurrentQuestion:(id)sender;
- (IBAction)decrementCurrentQuestion:(id)sender;

@end
