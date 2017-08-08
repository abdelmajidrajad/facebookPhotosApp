//
//  Album.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "Album.h"
@interface Album()

@end
@implementation Album
-(instancetype) initWithDictionary:(NSDictionary *) dictionary{
    self = [super init];
    if(!self) return nil;
    self.name = dictionary[@"name"];
    self.photosCount = [dictionary[@"photo_count"] integerValue];
    self.album_id = dictionary[@"id"];
    self.picture = [[Picture alloc] initWithDictionary:dictionary[@"picture"]];
    self.photos = [self createPhotos: dictionary[@"photos"][@"data"] ];
    return self;
}

-(NSArray *) createPhotos:(NSArray *)photosArray{
    if (photosArray == nil) {
        return nil;
    }
    NSMutableArray *photos = [NSMutableArray new];
    for (NSDictionary *mPhoto in photosArray) {
        Photo *photo = [[Photo alloc] initWithDictionary:mPhoto];
        [photos addObject:photo];
    }
    return photos;
}

//-(void)
@end
