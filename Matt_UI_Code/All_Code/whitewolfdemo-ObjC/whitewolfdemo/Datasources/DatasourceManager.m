//
//  DatasourceManager.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "WwdemoDS.h"
#import "GoogleTrendsTestDS.h"
#import "TasksDBDS.h"
#import "ThreatmapDBDS.h"
#import "EmptyDatasource.h"

@implementation DatasourceManager

+ (instancetype)sharedInstance {

    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Properties init

- (WwdemoDS *)wwdemoDS {

    if (!_wwdemoDS) {

        _wwdemoDS = [WwdemoDS new];
    }
    return _wwdemoDS;
}

- (GoogleTrendsTestDS *)googleTrendsTestDS {

    if (!_googleTrendsTestDS) {

        _googleTrendsTestDS = [GoogleTrendsTestDS new];
    }
    return _googleTrendsTestDS;
}

- (TasksDBDS *)tasksDBDS {

    if (!_tasksDBDS) {

        _tasksDBDS = [TasksDBDS new];
    }
    return _tasksDBDS;
}

- (ThreatmapDBDS *)threatmapDBDS {

    if (!_threatmapDBDS) {

        _threatmapDBDS = [ThreatmapDBDS new];
    }
    return _threatmapDBDS;
}

- (EmptyDatasource *)emptyDatasource {

    if (!_emptyDatasource) {

        _emptyDatasource = [EmptyDatasource new];
    }
    return _emptyDatasource;
}

#pragma mark - Public methods

- (void)sync {

    [self.wwdemoDS sync];
    [self.googleTrendsTestDS sync];
    [self.tasksDBDS sync];
    [self.threatmapDBDS sync];
}

@end

