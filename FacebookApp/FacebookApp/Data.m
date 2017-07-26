//
//  Data.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "Data.h"

@implementation Data
-(instancetype)initWithDictionary:(id)dictionary{
    if(!self) return nil;
    self.is_silhouette = [dictionary[@"is_silhouette"] boolValue];
    self.url = dictionary[@"url"];
    return self;
}
@end
