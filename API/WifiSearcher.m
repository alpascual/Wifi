//
//  WifiSearcher.m
//  Wifi
//
//  Created by Albert Pascual on 5/4/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "WifiSearcher.h"

@implementation WifiSearcher


- (void) getBroadcastAddress
{
    NSString *ip = broadcastAddress();
    NSLog(@"Broadcast IP %@", ip);
}

static NSString * broadcastAddress()
//Gets Local IP of the device over Wifi
//Calculates & returns broadcast Address for the network
{
    NSString * broadcastAddr= @"Error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    
    if (success == 0)
    {
        temp_addr = interfaces;
        
        while(temp_addr != NULL)
        {
            // check if interface is en0 which is the wifi connection on the iPhone
            if(temp_addr->ifa_addr->sa_family == AF_INET)
            {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
                    broadcastAddr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)];
                    
                }
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en1"])
                {
                    broadcastAddr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)];
                    
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return broadcastAddr;
}
@end
