//
//  User.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Picture.h"
@interface User : NSObject
@property(nonatomic) double user_id;
@property(nonatomic) NSString* name;
@property(nonatomic) NSString* email;
@property(nonatomic) Picture* picture;
-(instancetype) initWithDictionary:(NSDictionary *) dictionary;
@end
