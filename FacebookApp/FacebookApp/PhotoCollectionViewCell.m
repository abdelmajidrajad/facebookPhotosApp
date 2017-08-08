//
//  photoCollectionViewCell.m
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 26/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>
@interface PhotoCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *checkImageView;
@end
@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //_checkImageView.hidden = YES;
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    self.selectedBackgroundView = view;
}
-(void)prepareForReuse{
    self.selected = YES;
}
-(void)bindView:(Photo *)photo{
    [_photoImageView sd_setImageWithURL:[NSURL URLWithString:photo.picture_url]
                       placeholderImage:[UIImage imageNamed:@"image.png"]];
}

@end
