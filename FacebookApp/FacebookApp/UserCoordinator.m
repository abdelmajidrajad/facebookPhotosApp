//
//  UserCoordinator.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "UserCoordinator.h"
#import "UserViewController.h"
#import "AlbumViewController.h"
#import "AlbumCoordinator.h"
@interface UserCoordinator()<UserControllerDelegate>
@property(nonatomic,weak) UINavigationController *navigationViewController;
@end
@implementation UserCoordinator
-(instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    self = [super init];
    if(!self) return nil;
    _navigationViewController = navigationController;
    return self;
}
-(void)start{
    UserViewController *userViewController =[UserViewController new];
    userViewController.title = @"Informations";
    userViewController.delegate = self;
    [_navigationViewController pushViewController:userViewController animated:YES];
}
-(void)showUserAlbums{
    id<Coordinator> albumCoordinator = [[AlbumCoordinator alloc] initWithNavigationController:_navigationViewController];
    [albumCoordinator start];
}
@end
