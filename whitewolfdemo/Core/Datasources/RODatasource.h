//
//  RODatasource.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class ROOptionsFilter;

typedef void (^RODatasourceSuccessBlock)(id reponse);
typedef void (^RODatasourceErrorBlock)(NSError *error, NSHTTPURLResponse *response);

@protocol RODatasource <NSObject>

- (void)load:(id)identifier onSuccess:(RODatasourceSuccessBlock)successBlock onFailure:(RODatasourceErrorBlock)failureBlock;

- (void)loadOnSuccess:(RODatasourceSuccessBlock)successBlock onFailure:(RODatasourceErrorBlock)failureBlock;

- (void)loadWithOptionsFilter:(ROOptionsFilter *)optionsFilter onSuccess:(RODatasourceSuccessBlock)successBlock onFailure:(RODatasourceErrorBlock)failureBlock;

- (void)distinctValues:(NSString *)columnName filters:(NSArray *)filters onSuccess:(RODatasourceSuccessBlock)successBlock onFailure:(RODatasourceErrorBlock)failureBlock;

- (NSString *)imagePath:(NSString *)path;

- (__unsafe_unretained Class)objectsClass;

@end
