//
//  RORestClient.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@import AFNetworking;

@class ROError;

@interface RORestClient : NSObject

typedef void (^SuccessBlock)(id response);

typedef void (^FailureBlock)(ROError *error);

typedef void (^CompleteBlock)(BOOL success);

typedef void (^ProgressBlock)(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations);

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSString *baseUrlString;

@property (nonatomic, assign) NSTimeInterval timeout;

@property (nonatomic, strong) NSMutableDictionary *headerFields;

- (instancetype)initWithBaseUrlString:(NSString *)baseUrlString timeout:(NSTimeInterval)timeout;

#pragma mark - Manager

- (void)get:(NSString *)service params:(NSDictionary *)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)post:(NSString *)service params:(id)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)put:(NSString *)service params:(id)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)delete:(NSString *)service params:(NSDictionary *)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

#pragma mark - Upload

- (void)post:(NSString *)service params:(NSDictionary *)params data:(NSData *)data name:(NSString *)name mimeType:(NSString *)mimeType responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)post:(NSString *)service params:(NSDictionary *)params datas:(NSDictionary *)datas mimeType:(NSString *)mimeType responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)put:(NSString *)service params:(NSDictionary *)params datas:(NSDictionary *)datas mimeType:(NSString *)mimeType responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

#pragma mark - Helpers

- (NSMutableURLRequest *)request:(NSString *)method service:(NSString *)service params:(NSDictionary *)params bodyParams:(NSDictionary *)bodyParams failureBlock:(FailureBlock)failureBlock;

- (void)processSuccess:(NSURLSessionDataTask *)task responseObject:(id)responseObject responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock;

- (void)processFailure:(NSURLSessionDataTask *)task error:(NSError *)error failureBlock:(FailureBlock)failureBlock;

@end
