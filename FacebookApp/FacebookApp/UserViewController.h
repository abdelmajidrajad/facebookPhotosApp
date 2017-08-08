//
//  UserViewController.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UserControllerDelegate<NSObject>
-(void) showUserAlbums;
@end
@interface UserViewController : UIViewController
@property(nonatomic) id<UserControllerDelegate> delegate;
@end
