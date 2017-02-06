//
//  ROCloudantManager.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "CloudantSync.h"

extern NSString *kDatastore;
extern NSString *kIndexSearch;
extern NSString *kFilterSearch;

@interface ROCloudantManager : NSObject

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) NSString *datastoreName;

@property (nonatomic) BOOL searchIndexesCreated;

@property (nonatomic) BOOL filterIndexesCreated;

@property (nonatomic, strong) CDTReplicator *pullReplicator;

@property (nonatomic, strong) CDTReplicator *pushReplicator;

@property (nonatomic, strong) CDTDatastoreManager *datastoreManager;

@property (nonatomic, strong) CDTDatastore *datastore;

@property (nonatomic, strong) CDTReplicatorFactory *replicatorFactory;

@property (nonatomic, weak) id<CDTReplicatorDelegate> delegate;

- (void)sync;

- (void)pull;

- (void)push;

@end
