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
-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    if(!self) return nil;
    self.name = dictionary[@"name"];
    self.photosCount = [dictionary[@"photo_count"] integerValue];
    self.album_id = [dictionary[@"id"] integerValue];
    self.picture = dictionary[@"picture"];
    return self;
}
@end
