//
//  PhotosViewController.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "PhotosViewController.h"
#import <Masonry.h>
#import "PhotoCollectionViewCell.h"
#import "Album.h"
#import "PhotoViewCollection.h"
@interface PhotosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic) NSArray *photos;
@property(nonatomic) UICollectionView *photoCollectionView;
@end
@implementation PhotosViewController
static NSString * reuseIdentifier = @"albumCellIdentifier";
-(instancetype) initWithPhotosArray:(NSArray *) photos{
    self = [super init];
    if(!self) return nil;
    _photos = photos;

    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupConstraint];
    [self registerCell];
    _photoCollectionView.delegate = self;
    _photoCollectionView.dataSource = self;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void) setupConstraint{
    [self.photoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma -mark datasource methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_photos count];
}
-(PhotoCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

        Photo *photo = [_photos objectAtIndex:indexPath.row];
        [cell bindView:photo];
    
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float cellWidth = collectionView.frame.size.width / 3.0 -1;
    CGSize size = CGSizeMake(cellWidth, cellWidth);
    return size;
}

#pragma -mark delegate methods
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  //  PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSLog(@"Selected Cell");
    PhotoViewCollection *photoController = [[PhotoViewCollection alloc] initWithPictures:_photos];
    //[self.navigationController pushViewController:photoController animated:YES];
    [self.navigationController showDetailViewController:photoController sender:self];
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    // deselection
    //PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSLog(@"DisSelected Cell");
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(1, 1, 1, 1);
//}
#pragma private methods - setup collectionView
- (UICollectionViewFlowLayout *)createLayoutFlow {
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width/5, self.view.frame.size.width/5);
    layout.minimumLineSpacing = 2.0f;
    layout.minimumInteritemSpacing = 0.0f;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}
- (void)registerCell {
    UINib * cellNib = [UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil];
    [_photoCollectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
}
#pragma -mark getters
-(UICollectionView *)photoCollectionView{
    if (!_photoCollectionView) {
        UICollectionViewFlowLayout *flowLayout =[self createLayoutFlow];
        _photoCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        _photoCollectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        _photoCollectionView.showsHorizontalScrollIndicator  = NO;
        [self.view addSubview:_photoCollectionView];
    }
    return _photoCollectionView;
}
@end
