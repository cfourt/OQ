//
//  MapViewController.m
//  OrganicQuest
//
//  Created by Connor on 1/26/14.
//  Copyright (c) 2014 Connor. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMap:(UIStoryboardSegue *)segue{
}



@end