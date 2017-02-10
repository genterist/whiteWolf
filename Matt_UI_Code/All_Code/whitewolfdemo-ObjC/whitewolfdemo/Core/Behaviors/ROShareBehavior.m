//
//  ROShareBehavior.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROShareBehavior.h"
#import "ROCellDescriptor.h"
#import "ROHeaderCellDescriptor.h"
#import "ROTextCellDescriptor.h"
#import "ROUtils.h"
#import "UIViewController+RO.h"
#import "ROItemDelegate.h"
#import "RODataViewController.h"

@import SVProgressHUD;

@interface ROShareBehavior ()

@property (nonatomic, strong) UIBarButtonItem *shareItem;

- (void)share;

@end

@implementation ROShareBehavior

- (instancetype)initWithViewController:(RODataViewController *)viewController {
    
    self = [super init];
    if (self) {
        
        _viewController = viewController;
    }
    return self;
}

+ (instancetype)behaviorViewController:(RODataViewController *)viewController {
    
    return [[self alloc] initWithViewController:viewController];
}

- (NSMutableArray *)objectsToShare {
    
    if (!_objectsToShare) {
        
        _objectsToShare = [NSMutableArray new];
        if (_viewController.title) {
            [_objectsToShare addObject:self.viewController.title];
        }
        for (UIView *view in self.viewController.contentView.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)view;
                if (label.text) {
                    [_objectsToShare addObject:label.text];
                }
            }
        }
    }
    return _objectsToShare;
}

- (void)viewDidLoad {

    self.shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                   target:self
                                                                   action:@selector(share)];

    [self.viewController ro_addRightBarButtonItem:self.shareItem];
}

- (void)share {
    
    if ([self.objectsToShare count] != 0) {
    
        UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:self.objectsToShare
                                                                                         applicationActivities:nil];
        
        if ( [activityController respondsToSelector:@selector(popoverPresentationController)] ) {
            // iOS8
            activityController.popoverPresentationController.barButtonItem = self.shareItem;
            activityController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
        
        // Present the controller
        [self.viewController presentViewController:activityController animated:YES completion:nil];
        
        [[[ROUtils sharedInstance] analytics] logAction:@"share"
                                                 target:[self.objectsToShare componentsJoinedByString:@"\n"]];
    } else {
    
        [SVProgressHUD showInfoWithStatus:NSLocalizedString(@"No items to share", nil)];
    }
}

@end
