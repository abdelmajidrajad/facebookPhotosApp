//
//  PhotoViewController.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 28/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "PhotoViewController.h"
#import "UICarouselView.h"
#import "Photo.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>
@interface PhotoViewController ()<UICarouselViewDelegate,UICarouselViewDataSource>
@property(nonatomic) NSArray<Photo *> *photos;
@property(nonatomic) UICarouselView *carouselView;
@property(nonatomic) UIButton *quitButton;
@end
@implementation PhotoViewController
-(instancetype)initWithPictures:(NSArray *)photos{
    self = [super init];
    if(!self) return nil;
    _photos = photos;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViewConstraints];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    [self.carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.quitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.leading.equalTo(self.view).with.offset(8);
        make.height.width.equalTo(@30);
    }];
}
-(UIView *)viewAtIndexPath:(NSIndexPath *)indexPath{
    UIImageView *photoImageView = [UIImageView new];
    Photo *photo = _photos[indexPath.row];
    NSURL *photo_url = [[NSURL alloc] initWithString:photo.picture_url];
    photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [photoImageView sd_setImageWithURL:photo_url];
    return photoImageView;
}
-(NSInteger)numberOfItems{
 return _photos.count;
}
#pragma -mark private methods - navigation
-(void) quitCarroussel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma -mark getters
-(UICarouselView *)carouselView{
    if(!_carouselView)
    {
        _carouselView = [UICarouselView new];
        [self.view addSubview:_carouselView];
        _carouselView.delegate = self;
        _carouselView.dataSource = self;
    }
    return _carouselView;
}
-(UIButton *)quitButton{
    if(!_quitButton)
    {
        _quitButton = [UIButton new];
        [_quitButton setImage:[UIImage imageNamed:@"exit.png"] forState:UIControlStateNormal];
        [_quitButton addTarget:self action:@selector(quitCarroussel) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_quitButton];
    }
    return _quitButton;
}
@end
