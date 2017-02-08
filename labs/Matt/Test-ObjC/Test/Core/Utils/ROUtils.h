//
//  ROUtils.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROAnalytics.h"
#import "ROLogger.h"

@interface ROUtils : NSObject

@property (nonatomic, strong) id<ROAnalytics> analytics;

@property (nonatomic, strong) id<ROLogger> logger;

+ (instancetype)sharedInstance;

@end
