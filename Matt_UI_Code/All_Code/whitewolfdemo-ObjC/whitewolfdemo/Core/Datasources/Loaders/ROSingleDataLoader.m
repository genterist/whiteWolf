//
//  ROSingleDataLoader.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROSingleDataLoader.h"

@implementation ROSingleDataLoader

- (void)refreshDataSuccessBlock:(RODataSuccessBlock)successBlock failureBlock:(RODataFailureBlock)failureBlock
{
    [super refreshDataSuccessBlock:^(NSArray *items) {

        if (successBlock) {
            NSObject *item = nil;
            if (items && [items count] != 0) {
                item = items[0];
            }
            successBlock(item);
        }

    } failureBlock:failureBlock];
}

- (void)loadDataSuccessBlock:(RODataSuccessBlock)successBlock failureBlock:(RODataFailureBlock)failureBlock
{
    [self refreshDataSuccessBlock:successBlock failureBlock:failureBlock];
}

@end
