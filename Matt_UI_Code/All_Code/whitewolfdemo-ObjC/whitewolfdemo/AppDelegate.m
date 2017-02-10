//
//  AppDelegate.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//
#import "AppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "MainNavigationManager.h"
#import "ROStyle.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "NSUserDefaults+AESEncryptor.h"
#import "DatasourceManager.h"
#import "ROUtils.h"
#import "Analytics.h"
#import "Logger.h"
#import "Push.h"

@interface AppDelegate()

@property (nonatomic, strong) id<ROPushDelegate> push;
- (void)setup;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setup];
	

    // Push
    self.push = [[Push alloc] initWithLaunchOptions:launchOptions];
    [self.push registerRemoteNotifications];
	

    // Apply styles
    [[ROStyle sharedInstance] apply];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    self.window.backgroundColor = [[ROStyle sharedInstance] backgroundColor];

    // Set root view controller
    [self.window setRootViewController:[[MainNavigationManager sharedInstance] rootViewController]];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {

    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    [[MainNavigationManager sharedInstance] enterBackground];

    [[[ROUtils sharedInstance] analytics] enterBackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

    [[MainNavigationManager sharedInstance] enterForeground];

    [[[ROUtils sharedInstance] analytics] enterForeground];
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[MainNavigationManager sharedInstance] terminate];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    [self.push application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

    [self.push application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

    [self.push application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [self.push application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

#pragma mark - Private methods

- (void)setup {

    [[DatasourceManager sharedInstance] sync];


    // Analytics
    id <ROAnalytics>analytics = [Analytics new];
    [analytics setup];
    [[ROUtils sharedInstance] setAnalytics:analytics];
    
    // Logger
    id <ROLogger>logger = [Logger new];
    [[ROUtils sharedInstance] setLogger:logger];

    // Initialize AES Storage for user data
    [[NSUserDefaults standardUserDefaults] setAESKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]];

    // Image cache
    int cacheSizeMemory = 4*1024*1024; // 4MB
    int cacheSizeDisk = 32*1024*1024; // 32MB
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory
                                                            diskCapacity:cacheSizeDisk diskPath:@"nsurlcache"];
    [NSURLCache setSharedURLCache:sharedCache];

    [[SDImageCache sharedImageCache] cleanDisk];

    // Add a custom read-only cache path
    NSString *bundledPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CachePathImages"];
    [[SDImageCache sharedImageCache] addReadOnlyCachePath:bundledPath];

    // Enable network indicator
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
}

@end

