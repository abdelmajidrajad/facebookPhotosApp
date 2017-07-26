//
//  Album.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Picture.h"
#import "Photo.h"
@interface Album : NSObject
@property (nonatomic) NSString* album_id;
@property (nonatomic) NSInteger photosCount;
@property (nonatomic) NSString* name;
@property (nonatomic) Picture *picture;
@property (nonatomic) NSArray *photos;
-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
@end
