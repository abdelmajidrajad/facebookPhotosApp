//
//  UICarouselView.m
//  app-ecommerce-ios
//
//  Created by omar on 27/04/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

#import "UICarouselView.h"
#import "UIColor+GuideLine.h"
@interface UICarouselView ()
@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) NSInteger lastQuestionOffset;
@property(nonatomic) UIPageControl *pageControl;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic) CGFloat minimumSpacing;
@property(nonatomic) CGFloat cellWidth;
@property(nonatomic) NSInteger numberOfItems;
@property(nonatomic) CGFloat cellCornerRadius;
@end
@implementation UICarouselView
-(void)reloadData{

    _numberOfItems = [self.delegate numberOfItems];
    self.pageControl.numberOfPages = self.numberOfItems;
    [self.collectionView reloadData];
    if(self.numberOfItems > 15){
        self.pageControl.hidden = YES;
    }
}
-(void)invalidateLayout{
    self.pageControl.currentPage = 0;
    [self.collectionView.collectionViewLayout invalidateLayout];
}

-(void)layoutSubviews{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
    [self setUpConstraints];
}

-(void)setUpConstraints{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(self.insets);
    }];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(25);
        make.bottom.equalTo(self).with.offset(-10);
        make.centerX.equalTo(self);
    }];
    
    [self.collectionView setContentOffset:CGPointMake(-self.minimumSpacing, 0) animated:YES];

}


#pragma CollectionView

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    if ([self.delegate respondsToSelector:@selector(viewAtIndexPath:)]) {
        UIView *view = [self.delegate viewAtIndexPath:indexPath];
        [cell addSubview:view];
        [view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell);
        }];
    }
    cell.clipsToBounds = YES;
    cell.layer.cornerRadius = self.cellCornerRadius;
    return cell;    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.cellWidth ,(self.bounds.size.height - self.insets.top - self.insets.bottom));
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numberOfItems;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
#pragma mark - delegate methods
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    NSInteger page = self.pageControl.currentPage;
    if (self.lastQuestionOffset > scrollView.contentOffset.x)
        [self.pageControl setCurrentPage:page-1];
    else if (self.lastQuestionOffset < scrollView.contentOffset.x)
        [self.pageControl setCurrentPage:page+1];
    
    float questionOffset = (self.cellWidth * self.pageControl.currentPage) + (self.pageControl.currentPage-1) *self.minimumSpacing;
    self.lastQuestionOffset = questionOffset;
    [self.collectionView setContentOffset:CGPointMake(questionOffset, 0) animated:YES];
}




#pragma mark Getters

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = self.minimumSpacing;
        CGRect frame = UIEdgeInsetsInsetRect(self.frame, self.insets);
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        [self.collectionView setShowsVerticalScrollIndicator:NO];
        
    }
    return _collectionView;
}

-(UIPageControl *)pageControl{
    if(!_pageControl){
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.numberOfItems;
        _pageControl.pageIndicatorTintColor = [UIColor tealBlueTint];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueTint];
    }
    return _pageControl;
}



-(NSInteger)lastQuestionOffset{
    if(!_lastQuestionOffset){
        _lastQuestionOffset = 0;
    }
    return _lastQuestionOffset;
}

-(UIEdgeInsets)insets{
    if ([self.delegate respondsToSelector:@selector(containerInsets)]) {
        return [self.delegate containerInsets];
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

-(CGFloat)minimumSpacing{
    if(!_minimumSpacing){
        if ([self.delegate respondsToSelector:@selector(minimumSpacing)]) {
            _minimumSpacing = [self.delegate minimumSpacing];
        }else{
            _minimumSpacing = 5;
        }
    }
    return _minimumSpacing;
}

-(CGFloat)cellWidth{
    if ([self.delegate respondsToSelector:@selector(cellWithRatio)]) {
        _cellWidth = ([self.delegate cellWithRatio] * self.bounds.size.width) - self.minimumSpacing;
    }else{
        _cellWidth = 1.0 * self.bounds.size.width - self.minimumSpacing;
    }
    return _cellWidth;
}


-(NSInteger)numberOfItems{
    if(!_numberOfItems){
        if ([self.delegate respondsToSelector:@selector(numberOfItems)]) {
            _numberOfItems = [self.delegate numberOfItems];
        }else{
            _numberOfItems = 0;
        }
    }
    return _numberOfItems;
}

-(CGFloat)cellCornerRadius{
    if(!_cellCornerRadius){
        if ([self.delegate respondsToSelector:@selector(cellCornerRadius)]) {
            _cellCornerRadius = [self.delegate cellCornerRadius];
        }else{
            _cellCornerRadius = 0;
        }
    }
    return _cellCornerRadius;
}
@end
