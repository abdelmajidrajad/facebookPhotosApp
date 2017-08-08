//
//  AlbumViewController.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//
#define MAS_SHORTHAND
#import "AlbumViewController.h"
#import <Masonry.h>
#import "UIColor+GuideLine.h"
#import "AlbumStore.h"
#import "AlbumsCollectionViewCell.h"
#import "Album.h"
#import <FBSDKGraphRequest.h>
#import "PhotosViewController.h"
@interface AlbumViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic) NSArray *albums;
@property(nonatomic) UICollectionView *albumCollectionView;

@end

@implementation AlbumViewController
static NSString * reuseIdentifier = @"albumCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setupConstraint];
    [self registerCell];
    _albumCollectionView.delegate = self;
    _albumCollectionView.dataSource = self;
    [self fetshData];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_filter_48pt"] style:UIBarButtonItemStylePlain target:self action:@selector(sortByName)];

}

-(void) sortByName{
    NSArray *sortedArray = [_albums sortedArrayUsingComparator:^NSComparisonResult(Album * album, Album * album1) {
        return [album.name compare:album1.name];
    }];
    _albums = sortedArray;
    [self.albumCollectionView reloadData];
}
-(void) setupConstraint{
    [self.albumCollectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
-(void) fetshData{
    AlbumStore *store = [AlbumStore new];
     [store fetchAlbum:^(NSArray *albums){
         _albums = albums;
         [_albumCollectionView reloadData];
    }];
    }
#pragma -mark datasource methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_albums count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AlbumsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

        Album *album = [_albums objectAtIndex:indexPath.row];
        [cell bindView:album];

    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect screenRect = self.view.bounds;
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth / 2.0;
    CGSize size = CGSizeMake(cellWidth, 200);
    return size;
}

#pragma -mark delegate methods
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AlbumsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell selectedState];
     Album *album = [_albums objectAtIndex:indexPath.row];
    [self.delegate didTapAnAlbum:album];
    }
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    AlbumsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell deselectState];
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
#pragma private methods - setup collectionView
- (UICollectionViewFlowLayout *)createLayoutFlow {
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.width/3);
    layout.minimumLineSpacing = 2.0f;
    layout.minimumInteritemSpacing = 0.0f;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}
- (void)registerCell {
    UINib * cellNib = [UINib nibWithNibName:@"AlbumsCollectionViewCell" bundle:nil];
    [_albumCollectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
}
#pragma -mark getters
-(UICollectionView *)albumCollectionView{
    if (!_albumCollectionView) {
        UICollectionViewFlowLayout *flowLayout =[self createLayoutFlow];
        _albumCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        _albumCollectionView.backgroundColor = [UIColor whiteColor];
        _albumCollectionView.showsHorizontalScrollIndicator  = NO;
        [self.view addSubview:_albumCollectionView];

    }
    return _albumCollectionView;
}
@end
