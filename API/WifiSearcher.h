//
//  WifiSearcher.h
//  Wifi
//
//  Created by Albert Pascual on 5/4/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <net/ethernet.h>
#include <arpa/inet.h>
#include <ifaddrs.h>

@interface WifiSearcher : NSObject


- (void) getBroadcastAddress;



@end
