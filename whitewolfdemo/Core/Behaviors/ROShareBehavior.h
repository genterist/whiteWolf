//
//  ROShareBehavior.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@class RODataViewController;

@interface ROShareBehavior : NSObject <ROBehavior>

@property (nonatomic, strong) NSMutableArray *objectsToShare;

@property (nonatomic, strong) RODataViewController *viewController;

- (instancetype)initWithViewController:(RODataViewController *)viewController;

+ (instancetype)behaviorViewController:(RODataViewController *)viewController;

@end
