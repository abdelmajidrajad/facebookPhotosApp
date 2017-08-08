//
//  UserCoordinator.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"
@interface UserCoordinator : NSObject<Coordinator>
-(instancetype)initWithNavigationController:(UINavigationController *) navigationController;
@end
