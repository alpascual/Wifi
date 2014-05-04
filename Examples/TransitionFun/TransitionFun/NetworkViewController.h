//
//  NetworkViewController.h
//  Wifi
//
//  Created by Albert Pascual on 5/4/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WifiSearcher.h"

@interface NetworkViewController : UITableViewController <ECSlidingViewControllerDelegate>

@property (nonatomic,strong) WifiSearcher *searcher;

- (IBAction)menuButtonTapped:(id)sender;
@end
