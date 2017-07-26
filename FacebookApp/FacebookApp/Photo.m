//
//  Photo.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 26/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "Photo.h"
@implementation Photo
-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(!self) return nil;
    self.photo_id = dictionary[@"id"];
    self.picture_url = dictionary[@"picture"];
    return self;
}
@end
