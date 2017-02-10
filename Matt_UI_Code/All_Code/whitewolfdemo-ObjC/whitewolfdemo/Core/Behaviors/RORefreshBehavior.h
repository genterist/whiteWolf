//
//  RORefreshBehavior.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@protocol RODataDelegate;

@interface RORefreshBehavior : NSObject <ROBehavior>

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, strong) UIViewController<RODataDelegate> *viewController;

- (instancetype)initWithViewController:(UIViewController<RODataDelegate> *)viewController;

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate> *)viewController;

@end
