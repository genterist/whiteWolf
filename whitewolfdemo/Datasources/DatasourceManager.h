//
//  DatasourceManager.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class EmptyDatasource;

@interface DatasourceManager : NSObject

@property (nonatomic, strong) EmptyDatasource *emptyDatasource;

/**
 Singleton
 @return Class instance
 */
+ (instancetype)sharedInstance;

/**
 Synchronize all datasource
 */
- (void)sync;

@end

