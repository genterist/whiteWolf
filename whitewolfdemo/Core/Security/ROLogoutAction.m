//
//  ROLogoutAction.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROLogoutAction.h"
#import "MainNavigationManager.h"

@implementation ROLogoutAction

#pragma mark - <ROAction> 

- (void)doAction {

    [[MainNavigationManager sharedInstance] logout];
}

- (BOOL)canDoAction {

    return [[MainNavigationManager sharedInstance] loginEnabled];
}

- (UIImage *)actionIcon {

    return [UIImage imageNamed:@"logout"];
}

@end
