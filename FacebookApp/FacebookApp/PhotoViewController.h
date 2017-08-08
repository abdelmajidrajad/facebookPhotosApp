//
//  PhotoViewController.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 28/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;
@interface PhotoViewController : UIViewController
-(instancetype)  initWithPictures:(NSArray<Photo*>*) photos;
@end
