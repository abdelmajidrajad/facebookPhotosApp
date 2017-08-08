//
//  User.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "User.h"

@implementation User
-(instancetype) initWithDictionary:(NSDictionary *) dictionary{
    self = [super init];
    if (!self)
        return nil;
    self.user_id = [dictionary[@"id"] integerValue];
    self.name = dictionary[@"name"];
    self.email = dictionary[@"email"];
    self.picture = [[Picture alloc] initWithDictionary:dictionary[@"picture"]];
    return self;
}
@end
