//
//  photoCollectionViewCell.h
//  FacebookApp
//
//  Created by Abdelmajid Rajad on 26/07/2017.
//  Copyright © 2017 Hidden Founders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
@interface PhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
-(void) bindView:(Photo *) photo;
@end
