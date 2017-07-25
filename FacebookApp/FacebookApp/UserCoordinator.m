//
//  UserCoordinator.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "UserCoordinator.h"
#import "UserViewController.h"
@interface UserCoordinator()
@property(nonatomic,weak) UINavigationController *navigationViewController;
@end
@implementation UserCoordinator
-(instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    if(!self) return nil;
    
    _navigationViewController = navigationController;

    return self;
}
-(void)start{
    UserViewController *userViewController =[UserViewController new];
    [_navigationViewController pushViewController:userViewController animated:YES];
}
@end
