//
//  UIImageView+RO.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "UIImageView+RO.h"
#import "UIImage+RO.h"
#import "NSString+RO.h"
#import "UIColor+RO.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@implementation UIImageView (RO)

- (void)ro_setImage:(NSString *)imageString backgroundColor:(UIColor *)backgroundColor imageError:(UIImage *)imageError
{
    if (![imageString isUrl]) {
        
        UIImage *image = [UIImage imageNamed:imageString];
        if (!image) {
            image = imageError;
        }
        [self setImage:image];
        
    } else {
        
        [self ro_setImageWithUrlString:imageString backgroundColor:backgroundColor imageError:imageError];
        
    }
}

- (void)ro_setImage:(NSString *)imageString imageError:(UIImage *)imageError
{
    [self ro_setImage:imageString backgroundColor:self.superview.backgroundColor imageError:imageError];
}

- (void)ro_setImageWithUrlString:(NSString *)urlString backgroundColor:(UIColor *)backgroundColor imageError:(UIImage *)imageError
{
    __weak typeof(self) weakImageView = self;
    
    [self ro_setImageWithUrlString:urlString backgroundColor:backgroundColor completeBlock:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
    
            if (error) {        
                [weakImageView setImage:imageError];
            }
        });  
    }];
}

- (void)ro_setImageWithUrlString:(NSString *)urlString backgroundColor:(UIColor *)backgroundColor completeBlock:(SDWebImageCompletionBlock)completeBlock
{
    NSURL *url = [NSURL URLWithString:urlString];
    UIActivityIndicatorViewStyle indicatorStyle = UIActivityIndicatorViewStyleWhite;
    
    if (!backgroundColor) {
        backgroundColor = self.superview.backgroundColor;
    }
    
    if ([backgroundColor ro_lightStyle]) {
        indicatorStyle = UIActivityIndicatorViewStyleGray;
    }
    
    [self setImageWithURL:url placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageAllowInvalidSSLCertificates completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
    
            if (completeBlock) {
                completeBlock(image, error, cacheType, imageURL);
            }
        }); 
        
    } usingActivityIndicatorStyle:indicatorStyle];
}

- (void)ro_setImageWithUrlString:(NSString *)urlString imageError:(UIImage *)imageError
{
    [self ro_setImageWithUrlString:urlString backgroundColor:self.superview.backgroundColor imageError:imageError];
}

- (void)ro_setImageWithUrlString:(NSString *)urlString
{
    [self ro_setImageWithUrlString:urlString imageError:nil];
}

- (void)ro_setTintColor:(UIColor *)tintColor
{
    UIImage *image = self.image;
    if (image) {
        self.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    [self setTintColor:tintColor];    
}

- (void)ro_setImage:(NSString *)imageString imageError:(UIImage *)imageError containerView:(UIView *)containerView {
    
    if (![imageString isUrl]) {
        
        UIImage *image = [UIImage imageNamed:imageString];
        if (!image) {
            image = imageError;
        }
        [self setImage:image];
		dispatch_async(dispatch_get_main_queue(), ^{
            
            [self ro_fixHeight:containerView.bounds];
        });
        
    } else {
        
        __weak typeof(self) weakImageView = self;
        [self ro_setImageWithUrlString:imageString backgroundColor:nil completeBlock:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
        
                if (error) {        
                    [weakImageView setImage:imageError];
                }
                [weakImageView ro_fixHeight:containerView.bounds];
            });            
        }];
    }
}

- (void)ro_fixHeight:(CGRect)bounds {

    if (self.image == nil) {
        return;
    }
    
    float height = self.image.size.height;
    
    if (self.image.size.width > CGRectGetWidth(bounds)) {
        
        CGFloat ratio = self.image.size.width / self.image.size.height;
        CGSize newSize = CGSizeMake(CGRectGetWidth(bounds), CGRectGetWidth(bounds) / ratio);
        height = newSize.height;
    }
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        if ([constraint isKindOfClass:[NSLayoutConstraint class]]) {
            [self removeConstraint:constraint];
        }
    }
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:height];
    [self addConstraint:heightConstraint];
}

@end
