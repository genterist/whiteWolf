//
//  ROCloudantReplicatorManagerFactory.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROCloudantManagerBuilder.h"
#import "ROCloudantManager.h"
#import "ROCloudantDatastoreManagerBuilder.h"
#import "ROUtils.h"

@implementation ROCloudantManagerBuilder

+ (ROCloudantManager *)buildWithURL:(NSURL *)url datastoreName:(NSString *)datastoreName indexes:(NSArray *)indexes {
    
    CDTDatastoreManager *datastoreManager = [ROCloudantDatastoreManagerBuilder build:kDatastore];
    
    if (datastoreManager == nil) {
        
        return nil;
    }
    
    CDTReplicatorFactory *factory = [[CDTReplicatorFactory alloc] initWithDatastoreManager:datastoreManager];
    
    NSError *outError = nil;
    
    CDTDatastore *datastore = [datastoreManager datastoreNamed:datastoreName
                                                         error:&outError];
    
    if (nil != outError) {
        
        NSString *log = [NSString stringWithFormat:@"Error creating datastore: %@", outError];
        [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                            log:log
                                          level:ROLoggerLevelError];
        return nil;
    }
    
    if (datastore == nil) {
        
        return nil;
    }
    
    BOOL searchIndexesCreated = NO;
    BOOL filterIndexesCreated = NO;
    
    // Create search and filter indexes
    if ([indexes count] != 0) {
        
        NSDictionary * listIndexes = [datastore listIndexes];
        
        if ([datastore isTextSearchEnabled]) {
            
            NSArray *indexSearch = [listIndexes objectForKey:kIndexSearch];
            if (!indexSearch) {
                
                NSString *index = [datastore ensureIndexed:indexes
                                                  withName:kIndexSearch
                                                    ofType:CDTQIndexTypeText];
                
                searchIndexesCreated = (index != nil);
                
            } else {
                
                searchIndexesCreated = YES;
            }
        }
        
        NSArray *filterSearch = [listIndexes objectForKey:kFilterSearch];
        if (!filterSearch) {
            
            NSString *index = [datastore ensureIndexed:indexes
                                              withName:kFilterSearch
                                                ofType:CDTQIndexTypeJSON];
            
            filterIndexesCreated = (index != nil);
            
        } else {
            
            filterIndexesCreated = YES;
        }
        
        [[[ROUtils sharedInstance] logger] name:NSStringFromClass([self class])
                                            log:@"DB indexes"
                                          level:ROLoggerLevelInfo
                                       metadata:[datastore listIndexes]];
        
    }
    
    ROCloudantManager *cloudantManager = [ROCloudantManager new];
    cloudantManager.url = url;
    cloudantManager.datastore = datastore;
    cloudantManager.replicatorFactory = factory;
    
    cloudantManager.searchIndexesCreated = searchIndexesCreated;
    cloudantManager.filterIndexesCreated = filterIndexesCreated;
    
    return cloudantManager;
}

@end
