//
//  LayoutHelper.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "LayoutHelper.h"

@implementation LayoutHelper
+(void) addShadow:(UIView *) view{
    view.layer.masksToBounds = false;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowOffset = CGSizeMake(-1, 1);
    view.layer.shadowRadius = 0.5;
}
@end
