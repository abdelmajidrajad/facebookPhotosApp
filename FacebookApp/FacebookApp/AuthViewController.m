//
//  ViewController.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//
#define MAS_SHORTHAND

#define WIDTH @300
#define HEIGHT @200
#define OFFSET_TOP 100
#import "AuthViewController.h"
#import <FBSDKLoginKit.h>
#import <Masonry.h>
#import <FBSDKCoreKit.h>
#import "UIColor+GuideLine.h"
#import "PhotosViewController.h"
#import "UserViewController.h"
@interface AuthViewController ()<FBSDKLoginButtonDelegate>
@property(nonatomic) UIButton *goToAlbumButton;
@end
@implementation AuthViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupConstraints];
     [self connectedStatus];
     [self disconnectedStatus];
    self.view.backgroundColor = [UIColor tealBlueTint];
    self.loginButton.delegate = self;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
-(void)viewWillAppear:(BOOL)animated{
    if ([FBSDKAccessToken currentAccessToken]) {
        self.goToAlbumButton.hidden = NO;
    }else {
        self.goToAlbumButton.hidden = YES;
    }

}

-(void)navigate{
    [self connectedStatus];
}
-(void) connectedStatus{
    _messageLabel.hidden = YES;
    [self.delegate authentificationSuccess:[FBSDKAccessToken currentAccessToken]];
}
-(void) disconnectedStatus{
    [self.delegate authentificationFailed:self];
}
-(void) setupConstraints{
    [self.loginButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(WIDTH);
        make.height.equalTo(HEIGHT);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    [self.messageLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.bottom).with.offset(10);
        make.leading.equalTo(self.view).with.offset(10);
        make.trailing.equalTo(self.view).with.offset(-10);
        make.height.equalTo(@100);
    }];
    [self.goToAlbumButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.bottom).with.offset(10);
        make.leading.equalTo(self.view).with.offset(10);
        make.trailing.equalTo(self.view).with.offset(-10);
        make.height.equalTo(@50);
    }];
}
#pragma -mark delegate methods
-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    if (error!=nil) {
        NSLog(@"Error ! %@",error);
        [self disconnectedStatus];
    }
    [self connectedStatus];
}
-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    [self disconnectedStatus];
    NSLog(@"Log Out!");
    self.goToAlbumButton.hidden = YES;
}
#pragma -mark getters
-(FBSDKLoginButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [FBSDKLoginButton new];
        _loginButton.readPermissions = @[@"public_profile", @"email",@"user_photos"];
        [self.view addSubview:_loginButton];
    }
    return _loginButton;
}
-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.text = @"Connect with your facebook account";
        _messageLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightUltraLight];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_messageLabel];
    }
    return _messageLabel;
}
-(UIButton *)goToAlbumButton
{
    if (!_goToAlbumButton) {
        _goToAlbumButton = [UIButton new];
        [_goToAlbumButton setTitle:@"Start" forState:UIControlStateNormal];
        [_goToAlbumButton addTarget:self action:@selector(navigate) forControlEvents:UIControlEventTouchUpInside];
        _goToAlbumButton.backgroundColor = [UIColor purpleTint];
        [self.view addSubview:_goToAlbumButton];
    }
    return _goToAlbumButton;
}
@end
