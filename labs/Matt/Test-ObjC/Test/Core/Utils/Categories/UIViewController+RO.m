//
//  UIViewController+RO.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "UIViewController+RO.h"
#import "UIImage+RO.h"

@implementation UIViewController (RO)

#pragma mark - Modals

- (void)ro_dismissAllControllers {
    
    UIViewController *presentedViewController = self.presentedViewController;
    [presentedViewController dismissViewControllerAnimated:NO completion:^{
        
        [self performSelector:@selector(ro_dismissAllControllers)];
        
    }];
}

#pragma mark - Toolbar

- (void)ro_showBottomToolbarAnimated:(BOOL)animated {

    if ([self.toolbarItems count] != 0) {
    
        [self.navigationController setToolbarHidden:NO
                                           animated:animated];
    }
}

- (void)ro_hideBottomToolbarAnimated:(BOOL)animated {
    
    [self.navigationController setToolbarHidden:YES
                                       animated:animated];
}

- (void)ro_addRightBarButtonItem:(UIBarButtonItem *)barButtonItem {

    NSMutableArray *buttons = [NSMutableArray new];
    if (self.navigationItem.rightBarButtonItems) {
    
        [buttons addObjectsFromArray:self.navigationItem.rightBarButtonItems];
    
    } else if (self.navigationItem.rightBarButtonItem) {
    
        [buttons addObject:self.navigationItem.rightBarButtonItem];
    }
    [buttons addObject:barButtonItem];
    
    self.navigationItem.rightBarButtonItems = buttons;
}

- (void)ro_addBottomBarButton:(UIBarButtonItem *)barButtonItem animated:(BOOL)animated {

    NSMutableArray *buttons = [NSMutableArray new];
    if (self.toolbarItems) {
    
        [buttons addObjectsFromArray:self.toolbarItems];
    }
    UIBarButtonItem *flexibleBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                           target:nil
                                                                                           action:nil];
    [buttons addObject:flexibleBarButtonItem];
    [buttons addObject:barButtonItem];
    [buttons addObject:flexibleBarButtonItem];
    
    [self setToolbarItems:buttons animated:animated];
}

@end
