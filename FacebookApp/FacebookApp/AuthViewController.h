//
//  ViewController.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBSDKLoginButton,AuthViewController,FBSDKAccessToken;
@protocol UIAuthViewControllerDelegate<NSObject>
@required
-(void) authentificationSuccess:(FBSDKAccessToken *) token;
-(void) authentificationFailed:(AuthViewController *)authentificationController ;
@end
@interface AuthViewController : UIViewController
@property(nonatomic) FBSDKLoginButton *loginButton;
@property(nonatomic) UILabel *messageLabel;
@property(nonatomic) id<UIAuthViewControllerDelegate> delegate;
@end

