//
//  AlbumsCollectionViewCell.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "AlbumsCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LayoutHelper.h"
@interface AlbumsCollectionViewCell()
@end
@implementation AlbumsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    [LayoutHelper addShadow:self];
    // Initialization code
}
-(void)prepareForReuse{
    self.selected = YES;
}
-(void)bindView:(Album *)album{


    [_albumImageView sd_setImageWithURL:[NSURL URLWithString:album.picture.data.url]
                                 placeholderImage:[UIImage imageNamed:@"image.png"]];
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
