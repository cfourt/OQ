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

@property (weak, nonatomic) IBOutlet UILabel *currentLocationLabel;
@property (weak, nonatomic) IBOutlet UIButton *proceedLabel;
@property int mapPosition;

- (IBAction)unwindToMap:(UIStoryboardSegue *)segue;
@property (weak, nonatomic) IBOutlet UILabel *outOf;
@property (weak, nonatomic) IBOutlet UIImageView *percival;


- (IBAction)godminus:(id)sender;
- (IBAction)godPlus:(id)sender;
- (void)goToPosition:(int)pos;
@end
