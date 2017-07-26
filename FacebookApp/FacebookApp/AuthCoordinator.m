//
//  AppCoordinator.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AuthCoordinator.h"
#import "Coordinator.h"
#import <UIKit/UIKit.h>
#import "AuthViewController.h"
#import "UserViewController.h"
#import "UserCoordinator.h"
#import <FBSDKAccessToken.h>
@interface AuthCoordinator()<UIAuthViewControllerDelegate>
@property (nonatomic,weak) UINavigationController *navigationConroller;
@end
@implementation AuthCoordinator
-(instancetype) initWithNavigationController:(UINavigationController*) navigationController{
    self = [super init];
    if (!self) return nil;
    self.navigationConroller = navigationController;
    return self;
}
-(void)start{
    AuthViewController *viewController = [AuthViewController new];
    viewController.delegate = self;
    [_navigationConroller pushViewController:viewController animated:YES];
}
-(void)authentificationSuccess:(FBSDKAccessToken *)token{
    if (token) {
        // navigation
        id<Coordinator> userCoordinator = [[UserCoordinator alloc] initWithNavigationController:_navigationConroller];
        [userCoordinator start];
    }
}
-(void)authentificationFailed:(AuthViewController *)authentificationController{
    authentificationController.messageLabel.hidden = NO;
}
@end
