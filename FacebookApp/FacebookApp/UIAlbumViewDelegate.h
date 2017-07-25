//
//  UIAlbumViewDelegate.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIAlbumViewDelegate <NSObject>
@required
-(void) reloadAlbum:(NSArray *)data;
@end
