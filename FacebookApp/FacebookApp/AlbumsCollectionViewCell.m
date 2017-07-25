//
//  AlbumsCollectionViewCell.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AlbumsCollectionViewCell.h"
@interface AlbumsCollectionViewCell()
@end
@implementation AlbumsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)prepareForReuse{
    self.selected = YES;
}
-(void)bindView:(Album *)album{
    UIImage *image = [UIImage imageNamed:album.picture.data.url];
    _albumImageView.image = image;
    _albumTitleLabel.text = album.name;
    NSString *photosCount =[NSString stringWithFormat:@"%ld",(long)album.photosCount];_photosCount.text = photosCount;
}
-(void)selectedState{
    [UIView animateWithDuration:1 animations:^{
        _selectedSignature.alpha = 0;
    } completion:^(BOOL finished) {
        _selectedSignature.alpha = 1;
    }];
}
-(void) deselectState{
    [UIView animateWithDuration:1 animations:^{
        _selectedSignature.alpha = 1;
    } completion:^(BOOL finished) {
        _selectedSignature.alpha = 0;
    }];
}
@end
