//
//  ROLogoutBehavior.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROLogoutBehavior.h"
#import "ROLogoutAction.h"
#import "UIViewController+RO.h"

@interface ROLogoutBehavior ()

@property (nonatomic, strong) ROLogoutAction* logoutAction;

@end

@implementation ROLogoutBehavior

- (instancetype)initWithViewController:(UIViewController *)viewController {
    
    self = [super init];
    if (self) {
        
        _viewController = viewController;
        _logoutAction = [ROLogoutAction new];
    }
    return self;
}

+ (instancetype)behaviorViewController:(UIViewController *)viewController {
    
    return [[self alloc] initWithViewController:viewController];
}


- (void)viewDidLoad {
    
    if ([self.logoutAction canDoAction]) {
        
        UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithImage:[self.logoutAction actionIcon]
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(logout)];
        
        NSMutableArray *buttons = [NSMutableArray new];
        if (self.viewController.navigationItem.rightBarButtonItems) {
            
            [buttons addObjectsFromArray:self.viewController.navigationItem.rightBarButtonItems];
            
        } else if (self.viewController.navigationItem.rightBarButtonItem) {
            
            [buttons addObject:self.viewController.navigationItem.rightBarButtonItem];
        }
        
        [buttons insertObject:logoutButton atIndex:0];
        
        self.viewController.navigationItem.rightBarButtonItems = buttons;
    }
}

- (void)logout {
    
    [self.logoutAction doAction];
}

@end
