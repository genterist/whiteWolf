//
//  ROPagination.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "RODatasource.h"

@class ROOptionsFilter;

@protocol ROPagination <NSObject>

- (NSInteger)pageSize;

- (void)loadPageNum:(NSInteger)pageNum onSuccess:(RODatasourceSuccessBlock)successBlock onFailure:(RODatasourceErrorBlock)failureBlock;

- (void)loadPageNum:(NSInteger)pageNum withOptionsFilter:(ROOptionsFilter *)optionsFilter onSuccess:(RODatasourceSuccessBlock)successBlock onFailure:(RODatasourceErrorBlock)failureBlock;

@end
