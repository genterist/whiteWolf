//
//  LogoutBehavior.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@interface ROLogoutBehavior : NSObject <ROBehavior>

@property (nonatomic, strong) UIViewController *viewController;

- (instancetype)initWithViewController:(UIViewController *)viewController;

+ (instancetype)behaviorViewController:(UIViewController *)viewController;

@end
