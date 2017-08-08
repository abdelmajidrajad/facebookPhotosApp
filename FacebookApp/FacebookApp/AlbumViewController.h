//
//  AlbumViewController.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Album;
@protocol UIAlbumViewControllerDelegate<NSObject>
@required
-(void) didTapAnAlbum:( Album * _Nullable ) album;
@end
@interface AlbumViewController : UIViewController
@property (nonatomic, nullable) id <UIAlbumViewControllerDelegate> delegate;
@end
