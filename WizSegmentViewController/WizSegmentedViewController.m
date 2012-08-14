//
//  WizSegmentedViewController.m
//  Wiz
//
//  Created by wiz on 12-8-13.
//
//

#import "WizSegmentedViewController.h"
#define WizSegmentViewChangedDurationTime  0.5


@interface WizSegmentedViewController ()
{
    UISegmentedControl*  segementdControl;
    NSArray* viewControllers;
    UIViewController*  selectedViewController;
}
@property (nonatomic, assign)  UIViewController*  selectedViewController;;
@end

@implementation WizSegmentedViewController
@synthesize selectedViewController;
- (void) dealloc
{
    [viewControllers release];
    [segementdControl release];
    self.selectedViewController = nil;
    [super dealloc];
}


- (void) selectedViewControllerAtIndex:(NSInteger)index
{
    UIViewController* toViewController = [viewControllers objectAtIndex:index];
    
    if ([self.selectedViewController isEqual:toViewController]) {
        return;
    }
    if (self.selectedViewController != nil) {
        [selectedViewController viewWillDisappear:YES];
        [selectedViewController viewDidDisappear:YES];
    }
    self.selectedViewController = toViewController;
    [toViewController viewWillAppear:YES];
    //
    
    UIInterfaceOrientation fromInterfaceOrientation = toViewController.interfaceOrientation;
    UIInterfaceOrientation toInterfaceOrientation = [[UIDevice currentDevice] orientation];
    
    if (fromInterfaceOrientation != toInterfaceOrientation )
    {
        if (![self shouldAutorotateToInterfaceOrientation:toInterfaceOrientation]) {
            if ([toViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait])
            {
                toInterfaceOrientation = UIInterfaceOrientationPortrait;
            }
            else if ([toViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown])
            {
                toInterfaceOrientation = UIInterfaceOrientationPortraitUpsideDown;
            }
            else if ([toViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft])
            {
                toInterfaceOrientation = UIInterfaceOrientationLandscapeLeft;
            }
            else if ([toViewController shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight])
            {
                toInterfaceOrientation = UIInterfaceOrientationLandscapeRight;
            }
        }
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:(id)toInterfaceOrientation];
    }
    //
    self.view = toViewController.view;
    [toViewController viewDidAppear:YES];
}


- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self.selectedViewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self.selectedViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

- (void) changedItem:(id)sender
{
    UISegmentedControl* segementControl_ = (UISegmentedControl*)sender;
    NSInteger  selectedItemIndex = segementControl_.selectedSegmentIndex;
    [self selectedViewControllerAtIndex:selectedItemIndex];
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
    
    //
    segementdControl.frame = CGRectMake(0.0, 0.0, 160, 44);
    self.navigationItem.titleView = segementdControl;
    //
    [segementdControl setSelectedSegmentIndex:0];
    [self selectedViewControllerAtIndex:0];
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
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.selectedViewController viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.selectedViewController viewDidAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.selectedViewController viewWillDisappear:animated];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.selectedViewController viewDidDisappear:animated];
}
@end
