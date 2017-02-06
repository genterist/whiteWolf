//
//  MainNavigationManager.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//
#import "MainMenuViewController.h"
#import "MainNavigationManager.h"
#import "ROBasicAuthLoginService.h"
#import "ROLoginManager.h"
#import "ROLoginViewController.h"
#import "ROStyle.h"
#import "UIViewController+RO.h"
#import "UIViewController+Sliding.h"
#import "WHITEWOLFHAITOOLViewController.h"

@interface MainNavigationManager ()

@property (nonatomic, strong) ROLoginViewController *loginViewController;

@end

@implementation MainNavigationManager

+ (instancetype)sharedInstance {

    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (instancetype)init {

    self = [super init];
    if (self) {

        _loginEnabled = YES;
    }

    return self;
}

- (UIViewController *)rootViewController {

    UIViewController *viewController;

    if (self.loginEnabled) {

        viewController = self.loginViewController;

    } else {

        viewController = self.mainViewController;
    }

    return viewController;
}
- (UIViewController *)mainViewController {

    if (!_mainViewController) {

        UIViewController *rootViewController = [WHITEWOLFHAITOOLViewController new];

        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];

        [rootViewController ro_addLeftSlidingButton];

        navigationController.view.layer.shadowOpacity = 0.75f;
        navigationController.view.layer.shadowRadius = 10.0f;
        navigationController.view.layer.shadowColor = [UIColor blackColor].CGColor;

        navigationController.view.backgroundColor = [[ROStyle sharedInstance] backgroundColor];

        ECSlidingViewController *slidingViewController = [[ECSlidingViewController alloc] initWithTopViewController:navigationController];

        [navigationController.view addGestureRecognizer:slidingViewController.panGesture];

        MainMenuViewController *mainMenuViewController = [MainMenuViewController new];

        UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController:mainMenuViewController];

        menuNavigationController.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeBottom | UIRectEdgeLeft;

        slidingViewController.underLeftViewController = menuNavigationController;

        slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesturePanning|ECSlidingViewControllerAnchoredGestureTapping;
		
		_mainViewController = slidingViewController;
    }

    return _mainViewController;
}

- (ROLoginViewController *)loginViewController {

    if (!_loginViewController && self.loginEnabled) {

        _loginViewController = [ROLoginViewController new];

        _loginViewController.loginService = [[ROBasicAuthLoginService alloc] initWithBaseUrl:@"https://appbuilder.ibmcloud.com/api/app"
                                                                                       appId:@"c89f6ed7-f5f6-4b7d-b744-df096cf01fde"];
        __weak typeof(self) weakSelf = self;
        [_loginViewController setOnSuccessBlock:^{

            UIViewController *presentViewController = weakSelf.mainViewController;
            presentViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [weakSelf.loginViewController presentViewController:presentViewController
                                                       animated:NO
                                                     completion:nil];


        } onFailureBlock:^{

        }];

    }

    return _loginViewController;
}

- (void)enterBackground {

    // save last active state
    if ([self loginEnabled]) {

        [[ROLoginManager sharedInstance] saveLastSuspendDate];
    }
}

- (void)enterForeground {

    // check login status and redirect if needed
    if ([self loginEnabled]) {

        __weak typeof(self) weakSelf = self;
        [[ROLoginManager sharedInstance] checkLoginStateAndRedirect:^{

            [weakSelf.loginViewController reset];
            [weakSelf.loginViewController ro_dismissAllControllers];

        }];
    }
}

- (void)terminate {

    if ([self loginEnabled]) {

        [[ROLoginManager sharedInstance] resetLoginState];
    }
}

- (void)logout {

    if ([self loginEnabled]) {

        [self.loginViewController reset];
        
        __weak typeof(self) weakSelf = self;
        [self.mainViewController dismissViewControllerAnimated:YES completion:^{
           
            weakSelf.mainViewController = nil;
        }];
    }
}
@end

