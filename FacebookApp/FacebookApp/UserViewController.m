//
//  UserViewController.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 25/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//
#define MAS_SHORTHAND
#define WIDTH @50
#define HEIGHT @50
#define OFFSET 10
#define WIDTH_LABEL @100
#define HEIGHT_LABEL @30
#define OFFSET_TOP 100
#import "UserViewController.h"
#import <FBSDKCoreKit.h>
#import <Masonry.h>
#import "User.h"
#import "UIColor+GuideLine.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LayoutHelper.h"
@interface UserViewController ()
@property(nonatomic) UIImageView *userImageView;
@property(nonatomic) UILabel *emailLabel;
@property(nonatomic) UILabel *nameLabel;
@property(nonatomic) UIView *container;
@property(nonatomic) UIButton *albumButton;
@end
@implementation UserViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewConstraints];
    [self synchronizeData];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void) synchronizeData{
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"me"
                                      parameters:@{@"fields":@"id,name,email,picture"}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                              NSDictionary *result,
                                              NSError *error) {
            User *user = [[User alloc] initWithDictionary:result];
            [self layoutViews:user];
        }];
}
-(void) layoutViews:(User *) user{
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:user.picture.data.url]
                 placeholderImage:[UIImage imageNamed:@"image.png"]];
    _nameLabel.text = user.name;
    _emailLabel.text = user.email;
}
#pragma -mark constraint
-(void) setupViewConstraints{
    [self.container makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(OFFSET_TOP);
        make.leading.equalTo(self.view).with.offset(10);
        make.trailing.equalTo(self.view).with.offset(-10);
        make.height.equalTo(@100);
    }];

    [self.userImageView makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.container).with.offset(OFFSET);
        make.width.equalTo(WIDTH);
        make.height.equalTo(HEIGHT);
        make.centerY.equalTo(self.container.centerY);
    }];
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.container).with.offset(OFFSET);
        make.trailing.equalTo(self.container).with.offset(-OFFSET);
        make.leading.equalTo(self.userImageView.trailing);
        make.height.equalTo(HEIGHT_LABEL);
    }];
    [self.emailLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.bottom).with.offset(OFFSET);
        make.trailing.equalTo(self.container).with.offset(-OFFSET);
        make.leading.equalTo(self.userImageView.trailing);
        make.height.equalTo(HEIGHT_LABEL);
    }];
    [self.albumButton makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom).with.offset(-20);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@50);make.width.equalTo(@200);
    }];
}
#pragma -mark getters
-(UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [UIImageView new];
        [_container  addSubview:_userImageView];
    }
    return _userImageView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font =[UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        [_container  addSubview:_nameLabel];
    }
    return _nameLabel;
}
-(UILabel *)emailLabel{
    if (!_emailLabel) {
        _emailLabel = [UILabel new];
        _emailLabel.textAlignment = NSTextAlignmentCenter;
        _emailLabel.font =[UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        [_container addSubview:_emailLabel];
    }
    return _emailLabel;
}
-(UIView *)container{
    if (!_container) {
        _container = [UIView new];
        _container.backgroundColor = [UIColor tealBlueTint];
        [LayoutHelper addShadow:_container];
        [self.view addSubview:_container];
    }
    return _container;
}
-(void) tapAlbumButton{
    [self.delegate showUserAlbums];
}
-(UIButton *)albumButton{
    if (!_albumButton) {
        _albumButton = [UIButton new];
        [_albumButton setTitle:@"My Album" forState:UIControlStateNormal];
        _albumButton.backgroundColor = [UIColor blueTint];
        [_albumButton addTarget:self action:@selector(tapAlbumButton) forControlEvents:UIControlEventTouchUpInside];
        [LayoutHelper addShadow:_albumButton];
        [self.view addSubview:_albumButton];
    }
    return _albumButton;
}
@end
