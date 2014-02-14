//
//  PreKnowledgeViewController.h
//  OrganicQuest
//
//  Created by Connor Fourt on 2/13/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KnowledgeContentViewController.h"

@interface PreKnowledgeViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;
- (IBAction)startWalkthrough:(id)sender;

@end
