//
//  NetworkManager.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
+ (instancetype)networkSharedInstance;
- (instancetype)init NS_UNAVAILABLE;
@end
