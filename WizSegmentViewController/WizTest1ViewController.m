//
//  WizTest1ViewController.m
//  WizSegmentViewController
//
//  Created by wiz on 12-8-13.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "WizTest1ViewController.h"

@interface WizTest1ViewController ()

@end

@implementation WizTest1ViewController

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
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 300)];
    label1.text = @"asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf";
    [self.view addSubview:label1];
    [label1 release];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
