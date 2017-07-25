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
-(instancetype)initWithTitle:(NSString *)title photos:(NSInteger)number image:(NSString *)image{
    if(!self) return nil;
    _title = title;
    _photosCount = number;
    _image = image;
    return self;
}
@end
