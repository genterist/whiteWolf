//
//  ROPhotoCollectionViewCell.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <UIKit/UIKit.h>

@interface ROPhotoCollectionViewCell : UICollectionViewCell

/**
 Image view
 */
@property (nonatomic, strong) UIImageView *photoImageView;

/**
 Selected image view
 */
@property (nonatomic, strong) UIImageView *selectedImageView;

/**
 Add all subviews
 */
- (void)setup;

/**
 Configure all constraints
 */
- (void)setupConstraints;

@end
