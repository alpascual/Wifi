//
//  NetworkViewController.m
//  Wifi
//
//  Created by Albert Pascual on 5/4/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "UIViewController+ECSlidingViewController.h"
#import "MEDynamicTransition.h"
#import "METransitions.h"

#import "NetworkViewController.h"

@interface NetworkViewController ()
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;
@end

@implementation NetworkViewController

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
   
    //Setting up the bar again
    //showing white status
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //preventing weird inset
    [self setAutomaticallyAdjustsScrollViewInsets: NO];
    
    //navigation bar work
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowOffset:CGSizeMake(1, 1)];
    [shadow setShadowColor:[UIColor blackColor]];
    [shadow setShadowBlurRadius:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSShadowAttributeName: shadow};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    // set fonts & colors
    //
    // see: http://stackoverflow.com/questions/19029833/ios-7-navigation-bar-text-and-arrow-color
    self.view.backgroundColor = [UIColor colorWithRed:40.0f/255.0f green:175.0f/255.0f blue:238.0f/255.0f alpha:1];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Museo500-Regular" size:20.0], NSFontAttributeName,
      [UIColor whiteColor], NSForegroundColorAttributeName,
      nil
      ]];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // set navigation buttons
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0; //self.transitions.all.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TransitionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    NSString *transition = self.transitions.all[indexPath.row][@"name"];
//    
//    cell.textLabel.text = transition;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // hack to get selectedBackgroundView's presentation layer to update after rotation.
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell.selectedBackgroundView.layer removeAllAnimations];
//    
//    NSDictionary *transitionData = self.transitions.all[indexPath.row];
//    id<ECSlidingViewControllerDelegate> transition = transitionData[@"transition"];
//    if (transition == (id)[NSNull null]) {
//        self.slidingViewController.delegate = nil;
//    } else {
//        self.slidingViewController.delegate = transition;
//    }
//    
//    NSString *transitionName = transitionData[@"name"];
//    if ([transitionName isEqualToString:METransitionNameDynamic]) {
//        self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGestureCustom;
//        self.slidingViewController.customAnchoredGestures = @[self.dynamicTransitionPanGesture];
//        [self.navigationController.view removeGestureRecognizer:self.slidingViewController.panGesture];
//        [self.navigationController.view addGestureRecognizer:self.dynamicTransitionPanGesture];
//    } else {
//        self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
//        self.slidingViewController.customAnchoredGestures = @[];
//        [self.navigationController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
//        [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
//    }
}

@end
