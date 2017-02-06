//
//  RONotificationHandler.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROAction.h"

@class RONotificationView;

@interface RONotificationHandler : NSObject

@property (nonatomic, strong) RONotificationView *notificationView;

@property (nonatomic, strong, readonly) UIView *containerView;

@property (nonatomic, strong) NSDictionary *userInfo;

@property (nonatomic, strong) id <ROAction> action;

- (void)showNotification;

- (void)dismissNotification;

- (void)tapOnNotification;

- (void)doNotificationAction;

@end
