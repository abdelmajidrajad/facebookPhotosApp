//
//  Picture.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"
@interface Picture : NSObject
@property(nonatomic) Data* data;
-(instancetype) initWithDictionary:(NSDictionary *) dictionary;
@end
