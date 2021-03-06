//
//  AlbumStore.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AlbumStore.h"
#import "Album.h"
#import <FBSDKGraphRequest.h>
@interface AlbumStore()
@property(nonatomic) NSMutableArray *albums;
@end
@implementation AlbumStore

-(instancetype)init{
    self = [super init];
    if(!self) return nil;
    _albums = [NSMutableArray new];
    return self;
}
-(void) fetchAlbum:(void(^)(NSArray *)) completion{
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"me/albums"
                                  parameters:@{@"fields":@"description,picture{url},photo_count,name"}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
        for (id albumElement in result[@"data"]) {
            Album *album = [[Album alloc] initWithDictionary:albumElement];
            [_albums addObject:album];
        }
        completion(_albums);
     }];
}
-(void) fetchPhotos:(NSString *)album_id completion:(void(^)(Album *)) completion{
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:album_id
                                  parameters:@{@"fields":@"photos{picture}"}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary* result,
                                          NSError *error) {
        Album *photos = [[Album alloc] initWithDictionary:result];
        completion(photos);
    }];
}
@end
