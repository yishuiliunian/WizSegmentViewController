//
//  WizSegViewController.m
//  WizSegmentViewController
//
//  Created by wiz on 12-8-13.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "WizSegViewController.h"

@interface WizSegViewController ()

@end

@implementation WizSegViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
