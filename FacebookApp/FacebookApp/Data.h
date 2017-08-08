//
//  Data.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
@property(nonatomic) BOOL is_silhouette;
@property(nonatomic) NSString* url;
@property(nonatomic) NSString* picture_url;
-(instancetype) initWithDictionary:(NSDictionary *) dictionary;
@end
