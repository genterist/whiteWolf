//
//  UIAlertView+RO.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <UIKit/UIKit.h>

/**
 Helper to UIAlertView
 */
@interface UIAlertView (RO)

/**
 Show alert error with a message
 @param message Message to show
 */
+ (void)ro_showWithErrorMessage:(NSString *)message;

/**
 Show alert info with a message
 @param message Message to show
 */
+ (void)ro_showWithInfoMessage:(NSString *)message;

@end
