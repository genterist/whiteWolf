//
//  ROSlidingAction.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROSlidingAction.h"
#import "ROCustomTableViewController.h"
#import "UIViewController+Sliding.h"

@implementation ROSlidingAction

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController destinationValue:(id)destinationValue {

    self = [super init];
    if (self) {

        if (rootViewController.slidingViewController) {

            _rootViewController = rootViewController.slidingViewController;

            if ([destinationValue isKindOfClass:[UIViewController class]]) {

                _destinationController = destinationValue;
                _destinationClass = [_destinationController class];

            } else {

                _destinationController = nil;
                _destinationClass = destinationValue;
            }
        }
    }
    return self;
}

+ (instancetype)navigationActionWithRootViewController:(UIViewController *)rootViewController destinationValue:(id)destinationValue {

    return [[self alloc] initWithRootViewController:rootViewController
                                   destinationValue:destinationValue];
}

- (UIViewController *)destinationController {

    if (!_destinationController) {

        if (_destinationClass) {

            _destinationController = [_destinationClass new];
        }
    }
    return _destinationController;
}

- (void)doAction {

    if ([self canDoAction]) {

        if (self.destinationController) {

            if (self.detailObject) {

                if ([self.destinationController isKindOfClass:[ROCustomTableViewController class]]) {

                    ROCustomTableViewController *viewController = (ROCustomTableViewController *)self.destinationController;
                    viewController.item = self.detailObject;

                    [self navigateToViewController:viewController];
                }

            } else {

                [self navigateToViewController:self.destinationController];
            }
        }
    }
}

- (BOOL)canDoAction {

    return self.rootViewController && self.destinationController && ![self.rootViewController isEqual:self.destinationController];
}

- (UIImage *)actionIcon {

    return [UIImage imageNamed:@"arrow"];
}

- (void)navigateToViewController:(UIViewController *)viewController {

    if ([self.rootViewController isKindOfClass:[ECSlidingViewController class]]) {

        ECSlidingViewController *slidingViewController = (ECSlidingViewController *)self.rootViewController;

        UINavigationController *navigationController = (UINavigationController *)slidingViewController.topViewController;

        [viewController ro_addLeftSlidingButton];

        [navigationController setViewControllers:@[self.destinationController]];
        [slidingViewController resetTopViewAnimated:YES onComplete:^{

            if ([viewController.toolbarItems count] == 0) {

                [viewController.navigationController setToolbarHidden:YES
                                                             animated:YES];
            }
        }];

    }
}

@end
