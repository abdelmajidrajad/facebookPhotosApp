//
//  Album.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject
@property (nonatomic) NSString* title;
@property (nonatomic) NSInteger photosCount;
@property (nonatomic) NSString* image;
-(instancetype) initWithTitle:(NSString *) title photos:(NSInteger) number image:(NSString*)image;
@end
