//
//  RODataViewController.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <UIKit/UIKit.h>
#import "ROAction.h"

@class ROTextStyle;

@interface ROScrollViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *behaviors;

@property (nonatomic, strong) NSMutableDictionary *actions;

@property (nonatomic, strong) NSMutableArray *mainConstraints;

@property (nonatomic, strong) NSMutableArray *scrollConstraints;

@property (nonatomic, strong) NSMutableArray *contentConstraints;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *contentView;

- (void)addSubview:(UIView *)view;

- (UILabel *)createLabelWithTextStyle:(ROTextStyle *)style text:(NSString *)text;

- (UILabel *)createLabelWithTextStyle:(ROTextStyle *)style;

- (UILabel *)createHeaderWithText:(NSString *)text;

- (UILabel *)createHeader;

- (UIImageView *)createImageView;

- (UIButton *)createButtonWithResource:(NSString *)resource;

- (void)setAction:(id<ROAction>)action view:(UIView *)view;

- (void)handlerAction:(id)sender;

@end
