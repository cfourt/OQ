//
//  MainViewController.h
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myVariables.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)unWindToStartMenu:(UIStoryboardSegue *)seque;
-(BOOL)prefersStatusBarHidden;

- (IBAction)reset:(id)sender;

@end
