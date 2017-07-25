//
//  AlbumViewController.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAlbumViewDelegate.h"
@interface AlbumViewController : UIViewController
@property (nonatomic, weak, nullable) id <UIAlbumViewDelegate> delegate;
@end
