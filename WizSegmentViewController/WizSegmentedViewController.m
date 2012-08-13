//
//  WizSegmentedViewController.m
//  Wiz
//
//  Created by wiz on 12-8-13.
//
//

#import "WizSegmentedViewController.h"

@interface WizSegmentedViewController ()
{
    UISegmentedControl*  segementdControl;
    NSArray* viewControllers;
    NSInteger  selectedViewControllerIndex;
}
@property (nonatomic, assign)  NSInteger  selectedViewControllerIndex;
@end

@implementation WizSegmentedViewController
@synthesize selectedViewControllerIndex;
- (void) dealloc
{
    [viewControllers release];
    [segementdControl release];
    [super dealloc];
}


- (void) changedItem:(id)sender
{
    UISegmentedControl* segementControl_ = (UISegmentedControl*)sender;
    NSInteger  selectedItemIndex = segementControl_.selectedSegmentIndex;
    
    UIViewController* selectedViewController = [viewControllers objectAtIndex:selectedViewControllerIndex];
    UIViewController* toViewController = [viewControllers objectAtIndex:selectedItemIndex];

    
    if (selectedItemIndex != selectedViewControllerIndex) {
        [selectedViewController viewWillDisappear:YES];
        [selectedViewController viewDidDisappear:YES];
        
        [toViewController viewWillAppear:YES];
        self.view = toViewController.view;
        [toViewController viewDidAppear:YES];

        
        selectedViewControllerIndex = selectedItemIndex;
    }
}

- (id) initWithViewControllers:(NSArray*)viewControllers_  titles:(NSArray*)titles
{
    self = [super init];
    if (self) {
        if ([viewControllers_ count] != [titles count])
        {
            return nil;
        }
        viewControllers = [viewControllers_ retain];
        segementdControl = [[UISegmentedControl alloc] initWithItems:titles];
        [segementdControl addTarget:self action:@selector(changedItem:) forControlEvents:UIControlEventValueChanged];
        selectedViewControllerIndex = 0;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.navigationItem.titleView = segementdControl;
    [segementdControl setSelectedSegmentIndex:0];
    
    self.view.backgroundColor = [UIColor redColor];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
