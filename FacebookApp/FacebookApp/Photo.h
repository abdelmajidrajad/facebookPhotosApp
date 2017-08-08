//
//  Photo.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 26/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"
@interface Photo : NSObject
@property(nonatomic) NSString* photo_id;
@property(nonatomic) NSString* picture_url;
-(instancetype) initWithDictionary:(NSDictionary *) dictionary;
@end
