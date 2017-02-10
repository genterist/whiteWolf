//
//  ROCloudantReplicatorManagerFactory.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class ROCloudantManager;

@interface ROCloudantManagerBuilder : NSObject

+ (ROCloudantManager *)buildWithURL:(NSURL *)url datastoreName:(NSString *)datastoreName indexes:(NSArray *)indexes;

@end
