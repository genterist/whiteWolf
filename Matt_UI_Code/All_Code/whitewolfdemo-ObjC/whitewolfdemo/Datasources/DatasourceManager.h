//
//  DatasourceManager.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class WwdemoDS;
@class GoogleTrendsTestDS;
@class TasksDBDS;
@class ThreatmapDBDS;
@class EmptyDatasource;

@interface DatasourceManager : NSObject

@property (nonatomic, strong) WwdemoDS *wwdemoDS;

@property (nonatomic, strong) GoogleTrendsTestDS *googleTrendsTestDS;

@property (nonatomic, strong) TasksDBDS *tasksDBDS;

@property (nonatomic, strong) ThreatmapDBDS *threatmapDBDS;

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

