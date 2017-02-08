//
//  UIViewController+RO.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <UIKit/UIKit.h>

/**
 Helpers to UIViewController
 */
@interface UIViewController (RO)

/**
 Dismiss all presented controllers
 */
- (void)ro_dismissAllControllers;

/**
 Add right bar button preserving the current buttons
 @param barButtonItem Bar button item to add
 */
- (void)ro_addRightBarButtonItem:(UIBarButtonItem *)barButtonItem;

/**
 Add bar button to toolbar bottom
 @param barButtonItem Bar button item to add
 */
- (void)ro_addBottomBarButton:(UIBarButtonItem *)barButtonItem animated:(BOOL)animated;

/**
 Show the toolbar at the bottom of the screen if there is any buttons
 @param animated Show with animation
 */
- (void)ro_showBottomToolbarAnimated:(BOOL)animated;

/**
 Hide the toolbar at the bottom of the screen
 @param animated Hide with animation
 */
- (void)ro_hideBottomToolbarAnimated:(BOOL)animated;

@end
