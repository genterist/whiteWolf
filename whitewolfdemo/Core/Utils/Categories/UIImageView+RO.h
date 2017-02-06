//
//  UIImageView+RO.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <UIKit/UIKit.h>

@import SDWebImage;

/**
 Helper to UIImageView
 */
@interface UIImageView (RO)

/**
 Load image from resource or url
 @param imageString Name or url image
 @param backgroundColor Image superview background color
 @param imageError Image to show when there is a error
 */
- (void)ro_setImage:(NSString *)imageString backgroundColor:(UIColor *)backgroundColor imageError:(UIImage *)imageError;

/**
 Load image from resource or url string
 @param imageString Name or url image
 @param imageError Image to show when there is a error
 */
- (void)ro_setImage:(NSString *)imageString imageError:(UIImage *)imageError;

/**
 Load image from url string
 @param imageString Url string
 @param backgroundColor Image superview background color
 @param imageError Image to show when there is a error
 */
- (void)ro_setImageWithUrlString:(NSString *)urlString backgroundColor:(UIColor *)backgroundColor imageError:(UIImage *)imageError;

/**
 Load image from url string
 @param imageString Url string
 @param imageError Image to show when there is a error
 */
- (void)ro_setImageWithUrlString:(NSString *)urlString imageError:(UIImage *)imageError;

/**
 Load image from url string
 @param imageString Url string
 */
- (void)ro_setImageWithUrlString:(NSString *)urlString;

/**
 Tint color
 */
- (void)ro_setTintColor:(UIColor *)tintColor;

- (void)ro_setImageWithUrlString:(NSString *)urlString backgroundColor:(UIColor *)backgroundColor completeBlock:(SDWebImageCompletionBlock)completeBlock;

- (void)ro_setImage:(NSString *)imageString imageError:(UIImage *)imageError containerView:(UIView *)containerView;

- (void)ro_fixHeight:(CGRect)bounds;

@end
