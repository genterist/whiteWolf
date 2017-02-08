//
//  RODatasourceParams.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROOptionsFilter.h"
#import "ROFilter.h"

@implementation ROOptionsFilter

- (NSMutableDictionary *)extra {
    
    if (!_extra) {
        _extra = [NSMutableDictionary new];
    }
    return _extra;
}

- (NSMutableArray *)filters {
    
    if(!_filters) {
        _filters = [NSMutableArray new];
    }
    return _filters;
}

- (NSMutableArray *)designFilters {
    
    if(!_designFilters) {
        _designFilters = [NSMutableArray new];
    }
    return _designFilters;
}

- (void)addDesignFilter:(id<ROFilter>)filter {

    if (filter) {
        [self.designFilters addObject:filter];
    }
}

@end
