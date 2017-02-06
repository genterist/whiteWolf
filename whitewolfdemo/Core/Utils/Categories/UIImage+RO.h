//
//  UIImage+RO.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <UIKit/UIKit.h>

/**
 Helper to UIImage
 */
@interface UIImage (RO)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)ro_fixRotation:(UIImage *)image;

- (UIImage *)ro_tintColor:(UIColor *)color;

@end
