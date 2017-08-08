//
//  UICarouselView.h
//  app-ecommerce-ios
//
//  Created by omar on 27/04/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry/Masonry.h"
@protocol UICarouselViewDelegate <NSObject>
@optional
-(UIEdgeInsets)containerInsets;
-(CGFloat)minimumSpacing;
-(CGFloat)cellWithRatio;
-(CGFloat)cellCornerRadius;
@end
@protocol UICarouselViewDataSource <NSObject>
@required
-(UIView *)viewAtIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)numberOfItems;
@optional
@end
@interface UICarouselView : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic) id delegate;
@property(nonatomic) id dataSource;
-(void) reloadData;
-(void) invalidateLayout;
@end
