//
//  AlbumCoordinator.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import <UIKit/UIKit.h>
@interface AlbumCoordinator : NSObject<Coordinator>
-(instancetype) initWithNavigationController:(UINavigationController *)navigationController;
@end
