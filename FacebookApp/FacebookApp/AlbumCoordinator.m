//
//  AlbumCoordinator.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AlbumCoordinator.h"
#import "AlbumViewController.h"
#import <FBSDKGraphRequest.h>
#import "Album.h"
#import "PhotosViewController.h"
#import "AlbumStore.h"
@interface AlbumCoordinator()<UIAlbumViewControllerDelegate>
@property(nonatomic,weak) UINavigationController *navigationConroller;
@end
@implementation AlbumCoordinator
-(instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    self = [super init];
    if(!self) return nil;
    _navigationConroller = navigationController;
    return self;
}
-(void)start{
    AlbumViewController *albumViewController = [AlbumViewController new];
    albumViewController.delegate = self;
    [_navigationConroller pushViewController:albumViewController animated:YES];
}
-(void)didTapAnAlbum:(Album *)album{
    AlbumStore *store = [AlbumStore new];
    [store fetchPhotos:album.album_id completion:^(Album * photos) {
        PhotosViewController *photoController = [[PhotosViewController alloc] initWithPhotosArray:photos.photos];
        [_navigationConroller pushViewController:photoController animated:YES];
    }];
}

@end
