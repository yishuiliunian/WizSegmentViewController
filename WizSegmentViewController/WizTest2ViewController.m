//
//  WizTest2ViewController.m
//  WizSegmentViewController
//
//  Created by wiz on 12-8-13.
//  Copyright (c) 2012年 cn.wiz. All rights reserved.
//

#import "WizTest2ViewController.h"

@interface WizTest2ViewController ()

@end

@implementation WizTest2ViewController

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
    
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 300)];
    label1.text = @"asdfasdfasdfasdfasdfasdfasdfaSDFASDHFJKSADHFJSDFHKASDHFASKJDFHKHJJKFHDKJFHJKADHFJAH觉得发挥喀什的恢复健康哈sdk解放后卡上的风科技啊sdk房交会就卡上的风科技阿萨德飞快就sdfasdfasdfasdf";
    [self.view addSubview:label1];
    [label1 release];
    
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
