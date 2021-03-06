//
//  AlbumStore.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Album;
@interface AlbumStore : NSObject
-(void) fetchAlbum:(void(^)(NSArray *)) completion ;
-(void) fetchPhotos:(NSString *)album_id completion:(void(^)(Album *)) completion;
@end
