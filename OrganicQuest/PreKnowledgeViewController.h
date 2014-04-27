//
//  PreKnowledgeViewController.h
//  OrganicQuest
//
//  Created by Connor Fourt on 3/2/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myVariables.h"

@interface PreKnowledgeViewController : UIViewController

@property NSArray *answersArray;
@property NSArray *questionsArray;

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
@end
