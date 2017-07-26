//
//  NetworkManager.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking.h>
@interface NetworkManager()
@property (nonatomic) NSURL *URL;
@property (nonatomic) AFURLSessionManager *manager;
@property (nonatomic)  NSURLSessionConfiguration *configuration;
@end
@implementation NetworkManager

+(instancetype)networkSharedInstance{
    static NetworkManager *managerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance = [NetworkManager new];
        managerInstance.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        managerInstance.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:managerInstance.configuration];
        //  i should work with facebook SDK
    });
    return managerInstance;
}



@end
