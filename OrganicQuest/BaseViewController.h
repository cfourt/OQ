//
//  BaseViewController.h
//  OrganicQuest
//
//  Created by Connor Fourt on 3/3/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KnowledgeContentViewController.h"

@interface BaseViewController : UIViewController <UIPageViewControllerDataSource>
    @property (strong, nonatomic) UIPageViewController *pageViewController;
    @property (strong, nonatomic) NSArray *pageImages;
@end
