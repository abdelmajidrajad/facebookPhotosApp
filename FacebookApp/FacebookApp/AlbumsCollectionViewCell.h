//
//  AlbumsCollectionViewCell.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 24/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
@interface AlbumsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *photosCount;
@property (weak, nonatomic) IBOutlet UIImageView *selectedSignature;
-(void) selectedState;
-(void)deselectState;
-(void) bindView:(Album *)album;
@end
