//
//  AppCoordinator.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"
@interface AuthCoordinator : NSObject<Coordinator>
-(instancetype) initWithNavigationController:(UINavigationController*) navgationController;
@end
