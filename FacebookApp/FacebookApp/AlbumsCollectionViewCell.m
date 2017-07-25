//
//  AlbumsCollectionViewCell.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AlbumsCollectionViewCell.h"
@interface AlbumsCollectionViewCell()
@property(nonatomic,assign) BOOL isSelected;
@end
@implementation AlbumsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)bindView:(Album *)album{
    UIImage *image = [UIImage imageNamed:album.image];
    _albumImageView.image = image;
    _albumTitleLabel.text = album.title;
    NSString *photosCount =[NSString stringWithFormat:@"%ld",(long)album.photosCount];_photosCount.text = photosCount;
}
-(void)selectedStatus{
    if (_isSelected) {
        _selectedSignature.alpha = 1;
        _selectedSignature.hidden = NO;
    }else{
        _selectedSignature.hidden = YES;
    }


}
@end
