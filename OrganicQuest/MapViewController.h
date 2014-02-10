//
//  MapViewController.h
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KnowledgeContentViewController.h"


@interface MapViewController : UIViewController <UIPageViewControllerDataSource>
- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;

@end
