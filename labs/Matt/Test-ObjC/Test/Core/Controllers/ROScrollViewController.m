//
//  RODataViewController.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROScrollViewController.h"
#import "UILabel+RO.h"
#import "ROTextStyle.h"
#import "ROStyle.h"
#import "UIImageView+RO.h"
#import "ROBehavior.h"
#import "UIView+RO.h"

@interface ROScrollViewController ()

@end

@implementation ROScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[ROStyle sharedInstance] backgroundColor];
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.contentView];

    UIImage *backgroundImage = [[ROStyle sharedInstance] backgroundImage];
    if (backgroundImage) {
        [self.view ro_setBackgroundImage:backgroundImage];
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange: previousTraitCollection];

    for (UIView *view in self.contentView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)view;
            [imageView ro_fixHeight:view.bounds];
        }
    }
}

#pragma mark - Properties

- (NSMutableArray *)behaviors {
    
    if (!_behaviors) {
        _behaviors = [NSMutableArray new];
    }
    return _behaviors;
}

- (NSMutableDictionary *)actions {

    if (!_actions) {
        _actions = [NSMutableDictionary new];
    }
    return _actions;
}

- (NSMutableArray *)mainConstraints {

    if (!_mainConstraints) {
        _mainConstraints = [NSMutableArray new];
    }
    return _mainConstraints;
}

- (NSMutableArray *)scrollConstraints {
    
    if (!_scrollConstraints) {
        _scrollConstraints = [NSMutableArray new];
    }
    return _scrollConstraints;
}

- (NSMutableArray *)contentConstraints {
    
    if (!_contentConstraints) {
        _contentConstraints = [NSMutableArray new];
    }
    return _contentConstraints;
}

- (UIScrollView *)scrollView {

    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.scrollsToTop = YES;
    }
    return _scrollView;
}

- (UIView *)contentView {

    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}

#pragma mark - Public methods

- (void)addSubview:(UIView *)view {

    if (view) {
        view.tag = self.contentView.subviews.count + 1;
    }
    [self.contentView addSubview:view];
}

- (UILabel *)createLabelWithTextStyle:(ROTextStyle *)style text:(NSString *)text {

    UILabel *label = [UILabel new];
    label.text = text;
    label.numberOfLines = 0;
    [label ro_style:style];
    return label;
}

- (UILabel *)createLabelWithTextStyle:(ROTextStyle *)style {

    return [self createLabelWithTextStyle:style text:nil];
}

- (UILabel *)createHeaderWithText:(NSString *)text {

    return [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleSmall
                                                        bold:NO
                                                      italic:NO
                                                textAligment:NSTextAlignmentLeft
                                                   textColor:[[[ROStyle sharedInstance] foregroundColor] colorWithAlphaComponent:0.5f]]
                                     text:text];
}

- (UILabel *)createHeader {

    return [self createHeaderWithText:nil];
}

- (UIImageView *)createImageView {

    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

- (UIButton *)createButtonWithResource:(NSString *)resource {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[[ROStyle sharedInstance] foregroundColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:resource] forState:UIControlStateNormal];
    [button setTintColor:[[ROStyle sharedInstance] foregroundColor]];
    return button;
}

- (void)setAction:(id<ROAction>)action view:(UIView *)view {

    if ([view isKindOfClass:[UIButton class]]) {
    
        UIButton *button = (UIButton *)view;
        [button removeTarget:self action:@selector(handlerAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(handlerAction:) forControlEvents:UIControlEventTouchUpInside];
   
    } else {
    
        view.userInteractionEnabled = YES;
        for (UIGestureRecognizer *gr in view.gestureRecognizers) {
            [view removeGestureRecognizer:gr];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlerAction:)];
        tap.numberOfTapsRequired = 1;
        [view addGestureRecognizer:tap];
    }
    self.actions[@(view.tag)] = action;
}

- (void)handlerAction:(id)sender {

    NSNumber *tag;
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
        tag = @(tap.view.tag);
        
    } else {
    
        UIView *view = (UIView *)sender;
        tag = @(view.tag);
    }
    if (tag) {
        
        id<ROAction>action = self.actions[tag];
        if (action && [action canDoAction]) {
            [action doAction];
        }
    }
}

@end
