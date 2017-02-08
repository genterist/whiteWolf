//
//  UIViewController+Sliding.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "UIViewController+Sliding.h"

@implementation UIViewController (Sliding)

- (void)ro_addLeftSlidingButton {
    
    UIBarButtonItem *navButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navMenu"]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(ro_revealLeftViewController)];
    
    self.navigationItem.leftBarButtonItem = navButton;
    
    self.navigationController.view.layer.shadowOpacity = 0.75f;
    self.navigationController.view.layer.shadowRadius = 10.0f;
    self.navigationController.view.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)ro_revealLeftViewController {
    
    ECSlidingViewController *slidingController = self.slidingViewController;
    if (slidingController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionCentered) {
        [slidingController anchorTopViewToRightAnimated:YES];
    } else {
        [slidingController resetTopViewAnimated:YES];
    }
}

- (void)ro_revealRightViewController {
    
    ECSlidingViewController *slidingController = self.slidingViewController;
    if (slidingController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionCentered) {
        [slidingController anchorTopViewToLeftAnimated:YES];
    } else {
        [slidingController resetTopViewAnimated:YES];
    }
}

@end
