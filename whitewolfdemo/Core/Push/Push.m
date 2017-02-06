//
//  Push.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "Push.h"
#import "ROUtils.h"
#import "RONotificationHandler.h"
#import "whitewolfdemo-Swift.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


@import UserNotifications;

@interface Push () <UNUserNotificationCenterDelegate>

@property (nonatomic, strong) RONotificationHandler *notificationHandler;

@end

@implementation Push

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        // Init bluemix
        [BluemixPush sharedInstance];
    }
    return self;
}

- (instancetype)initWithLaunchOptions:(NSDictionary *)launchOptions {

    self = [super init];
    if (self) {
        
        self.notificationHandler.userInfo = [launchOptions valueForKey:@"UIApplicationLaunchOptionsRemoteNotificationKey"];
        
        // Init bluemix
        [BluemixPush sharedInstance];
    }
    return self;
}

- (void)registerRemoteNotifications {

    if (SYSTEM_VERSION_LESS_THAN(@"10.0")) {
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
    } else {
        
        [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
             if (!error) {
                 
                 [[UIApplication sharedApplication] registerForRemoteNotifications]; // required to get the app to do anything at all about push notifications
                 
                 [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                                     log:@"Push registration success."
                                                   level:ROLoggerLevelInfo];
             
             } else {
                 
                 [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                                     log:@"Push registration FAILED"
                                                   level:ROLoggerLevelError
                                                metadata:error.userInfo];
             }  
         }];  
    }
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                        log:[NSString stringWithFormat:@"APNS Token: %@", deviceToken]
                                      level:ROLoggerLevelInfo];

    [[BluemixPush sharedInstance] registerPush:deviceToken];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

    [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                        log:error.domain
                                      level:ROLoggerLevelError
                                   metadata:error.userInfo];
}

- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo {
    
    [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                        log:@"Received notification"
                                      level:ROLoggerLevelInfo
                                   metadata:userInfo];

    self.notificationHandler.userInfo = userInfo;
    
    [self.notificationHandler showNotification];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
      
        // set a member variable to tell the new delegate that this is background
#ifdef DEBUG
        NSLog (@"iOS version >= 10. Let NotificationCenter handle this one.");
#endif
        return;
    }
    
    self.notificationHandler.userInfo = userInfo;
    
    NSString *state = @"FOREGROUND";
    // custom code to handle notification content
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive) {
        
        state = @"INACTIVE";
    
    } else if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground) {
     
        state = @"BACKGROUND";
    
    } else {
    
        [self.notificationHandler showNotification];
    }
    completionHandler(UIBackgroundFetchResultNoData);
    
    [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                        log:[NSString stringWithFormat:@"Received notification. State: %@", state]
                                      level:ROLoggerLevelInfo
                                   metadata:userInfo];
}

#pragma mark - Properties init 

- (RONotificationHandler *)notificationHandler {

    if (!_notificationHandler) {
    
        _notificationHandler = [RONotificationHandler new];
    }
    return _notificationHandler;
}

#pragma mark - <UNUserNotificationCenterDelegate>

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    
    NSDictionary *userInfo = [[[notification request] content] userInfo];
    
    [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                        log:@"Handle push from foreground"
                                      level:ROLoggerLevelInfo
                                   metadata:userInfo];
    
    self.notificationHandler.userInfo = userInfo;
    
    [self.notificationHandler showNotification];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary *userInfo = [[[[response notification] request] content] userInfo];
    
    [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                        log:@"Handle push from background or closed"
                                      level:ROLoggerLevelInfo
                                   metadata:userInfo];
    
    [self.notificationHandler doNotificationAction];
}

@end
