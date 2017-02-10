//
//  GoogleTrendsTestDS.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "GoogleTrendsTestDS.h"
#import "GoogleTrendsTestDSSchemaItem.h"
#import "ROCloudantManager.h"
#import "ROError.h"

@implementation GoogleTrendsTestDS

static NSString *const kUrl           = @"https://a99a97b8-cde8-4992-8986-dcac813b9f12-bluemix:0b8375b6901a6ab9472e021be49175f43bb6bf2005ede936108a29084d6e38da@a99a97b8-cde8-4992-8986-dcac813b9f12-bluemix.cloudant.com/trendrecord/";
static NSString *const kDatastoreName = @"trendrecord";

- (instancetype)init {

    self = [super initWithUrlString:kUrl 
                      datastoreName:kDatastoreName
                       objectsClass:[GoogleTrendsTestDSSchemaItem class]];
    if (self) {
    
        self.delegate = self;
    }
    return self;
}

#pragma mark - <ROSearchable>

- (NSArray *)searchableFields {

    return @[];
}

#pragma mark - <ROCRUDServiceDelegate>

- (void)itemWithIdentifier:(NSString *)identifier successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSError *error;
    CDTDocumentRevision *revision = [self.cloudantManager.datastore getDocumentWithId:identifier
                                                                                error:&error];
    if (error) {
        
        if (failureBlock) {
            
            ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                              error:error];
            failureBlock(roError);
        }
        
    } else {
        
        id item = [[self.objectsClass alloc] initWithDocumentRevision:revision];
        
        if (successBlock) {
            
            successBlock(item);
        }
    }
}

- (void)createItemWithParams:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    id<ROCloudantItem, ROModelDelegate> item = [[self.objectsClass alloc] initWithDictionary:params];
    
    NSError *error;
    [self.cloudantManager.datastore createDocumentFromRevision:item.rev error:&error];
    
    if (error) {
        
        if (failureBlock) {
        
            ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                              error:error];
            failureBlock(roError);
        }
    
    } else {
    
        if (successBlock) {
        
            successBlock(item);
        }
    }
}

- (void)updateItemWithIdentifier:(NSString *)identifier params:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSError *error;
    CDTDocumentRevision *revision = [self.cloudantManager.datastore getDocumentWithId:identifier
                                                                                error:&error];
    if (error) {
        
        if (failureBlock) {
            
            ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                              error:error];
            failureBlock(roError);
        }
        
    } else {
        
        id<ROCloudantItem, ROModelDelegate> item = [[self.objectsClass alloc] initWithDocumentRevision:revision];
        [item updateWithDictionary:params];
        
        [self.cloudantManager.datastore updateDocumentFromRevision:item.rev
                                                             error:&error];
        
        if (error) {
            
            if (failureBlock) {
                
                ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                                  error:error];
                failureBlock(roError);
            }
            
        } else {
        
            if (successBlock) {
                
                successBlock(item);
            }
        }
    }
    
}

- (void)deleteItemWithIdentifier:(NSString *)identifier successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSError *error;
    NSArray *docs = [self.cloudantManager.datastore deleteDocumentWithId:identifier
                                                                   error:&error];
    
    if (error) {
        
        if (failureBlock) {
            
            ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                              error:error];
            failureBlock(roError);
        }
        
    } else {
        
        if (successBlock) {
            
            NSMutableArray *items = [NSMutableArray new];
            for (CDTDocumentRevision *revision in docs) {
            
                id item = [[self.objectsClass alloc] initWithDocumentRevision:revision];
                [items addObject:item];
            }
            successBlock(items);
        }
    }
}

- (void)deleteItemsWithIdentifiers:(NSArray *)identifiers successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSMutableArray *errors = [NSMutableArray new];
    NSMutableArray *items = [NSMutableArray new];
    for (NSString *identifier in identifiers) {
    
        NSError *error;
        NSArray *docs = [self.cloudantManager.datastore deleteDocumentWithId:identifier
                                                                       error:&error];
        
        if (error) {
            
            ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                              error:error];
            
            [errors addObject:roError];
            
        } else {
            
            NSMutableArray *removeItems = [NSMutableArray new];
            for (CDTDocumentRevision *revision in docs) {
                
                id item = [[self.objectsClass alloc] initWithDocumentRevision:revision];
                [removeItems addObject:item];
            }
            [items addObjectsFromArray:removeItems];
        }
    }
    if ([errors count] != 0) {
    
        if (failureBlock) {
            
            failureBlock([errors objectAtIndex:0]);
        }
    
    } else {
    
        if (successBlock) {
        
            successBlock(items);
        }
    }
}

@end

