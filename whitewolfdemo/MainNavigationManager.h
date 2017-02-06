//
//  MainNavigationManager.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@interface MainNavigationManager : NSObject

@property (nonatomic, strong, readonly) UIViewController *rootViewController;

@property (nonatomic, strong) UIViewController *mainViewController;

@property (nonatomic, assign) BOOL loginEnabled;

+ (instancetype)sharedInstance;

- (void)enterBackground;

- (void)enterForeground;

- (void)terminate;

- (void)logout;


@end
