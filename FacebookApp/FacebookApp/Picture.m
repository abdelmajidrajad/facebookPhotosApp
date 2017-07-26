//
//  Picture.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "Picture.h"

@implementation Picture
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (!self) return nil;
    self.data = [[Data alloc] initWithDictionary:dictionary[@"data"]];
    return self;
}
@end
