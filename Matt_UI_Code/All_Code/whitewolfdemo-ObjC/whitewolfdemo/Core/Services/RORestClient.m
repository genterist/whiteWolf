//
//  BRestClient.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "RORestClient.h"
#import "ROError.h"
#import "NSDictionary+RO.h"
#import "ROModel.h"

@import AFNetworking;
@import DCKeyValueObjectMapping;

@interface RORestClient ()

- (NSDictionary *)cleanParams:(NSDictionary *)params;

- (id)objectWithDictionary:(NSDictionary *)dic objectClass:(__unsafe_unretained Class)objectClass;

@end

@implementation RORestClient

- (instancetype)initWithBaseUrlString:(NSString *)baseUrlString timeout:(NSTimeInterval)timeout
{
    self = [super init];
    if (self) {
        _baseUrlString = baseUrlString;
        _timeout = timeout;
        
        _manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:self.baseUrlString]];
#ifdef DEBUG
        _manager.securityPolicy.allowInvalidCertificates = YES;
        _manager.securityPolicy.validatesDomainName = NO;
#endif
        // setup http basic auth
        [_manager.requestSerializer clearAuthorizationHeader];
        [_manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [_manager.requestSerializer setTimeoutInterval:self.timeout];
        
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (NSMutableDictionary *)headerFields
{
    if (!_headerFields) {
        _headerFields = [NSMutableDictionary new];
    }
    return _headerFields;
}

- (NSDictionary *)cleanParams:(NSDictionary *)params
{
    NSMutableDictionary *body = [NSMutableDictionary dictionaryWithDictionary:params];
    for (NSString *key in params) {
        if ([params[key] isKindOfClass:[NSNull class]]) {
            [body removeObjectForKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:body];
}

#pragma mark - Manager

- (void)get:(NSString *)service params:(NSDictionary *)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    __weak typeof (self) weakSelf = self;
    [self.manager GET:service parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

- (void)post:(NSString *)service params:(id)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    __weak typeof (self) weakSelf = self;
    [self.manager POST:service parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

- (void)put:(NSString *)service params:(id)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    __weak typeof (self) weakSelf = self;
    [self.manager PUT:service parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

- (void)delete:(NSString *)service params:(NSDictionary *)params responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    __weak typeof (self) weakSelf = self;
    [self.manager DELETE:service parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

#pragma mark - Upload

- (void)post:(NSString *)service params:(NSDictionary *)params data:(NSData *)data name:(NSString *)name mimeType:(NSString *)mimeType responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    __weak typeof (self) weakSelf = self;
    [self.manager POST:service parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSError *error = nil;
        [formData appendPartWithFormData:[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error] name:@"data"];
        
        [formData appendPartWithFileData:data
                                    name:@"data"
                                fileName:@"data"
                                mimeType:mimeType];
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

- (void)post:(NSString *)service params:(NSDictionary *)params datas:(NSDictionary *)datas mimeType:(NSString *)mimeType responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    __weak typeof (self) weakSelf = self;
    [self.manager POST:service parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSMutableDictionary *dicPost = [NSMutableDictionary new];
        
        [dicPost addEntriesFromDictionary:params];
        
        NSArray *keys = [datas allKeys];
        
        for (NSString *key in keys) {
            
            [dicPost setValue:[NSString stringWithFormat:@"cid:%@", key] forKey:key];
        }
        
        NSError *error = nil;
        [formData appendPartWithFormData:[NSJSONSerialization dataWithJSONObject:dicPost options:NSJSONWritingPrettyPrinted error:&error] name:@"data"];
        
        for (NSString *key in keys) {
            
            [formData appendPartWithFileData:[datas objectForKey:key]
                                        name:key
                                    fileName:key
                                    mimeType:mimeType];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

- (void)put:(NSString *)service params:(NSDictionary *)params datas:(NSDictionary *)datas mimeType:(NSString *)mimeType responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    __weak typeof (self) weakSelf = self;
    [self PUT:service parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSMutableDictionary *dicPost = [NSMutableDictionary new];
        
        [dicPost addEntriesFromDictionary:params];
        
        NSArray *keys = [datas allKeys];
        
        for (NSString *key in keys) {
            
            [dicPost setValue:[NSString stringWithFormat:@"cid:%@", key] forKey:key];
        }
        
        NSError *error = nil;
        [formData appendPartWithFormData:[NSJSONSerialization dataWithJSONObject:dicPost options:NSJSONWritingPrettyPrinted error:&error] name:@"data"];
        
        for (NSString *key in keys) {
            
            [formData appendPartWithFileData:[datas objectForKey:key]
                                        name:key
                                    fileName:key
                                    mimeType:mimeType];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf processSuccess:task
                  responseObject:responseObject
                   responseClass:responseClass
                    successBlock:successBlock];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf processFailure:task
                           error:error
                    failureBlock:failureBlock];
    }];
}

#pragma mark - Helpers

- (NSMutableURLRequest *)request:(NSString *)method service:(NSString *)service params:(NSDictionary *)params bodyParams:(NSDictionary *)bodyParams failureBlock:(FailureBlock)failureBlock
{
    NSString *urlString = [[self.manager.baseURL absoluteString] stringByAppendingString:service];
    NSError *error = nil;
    
    /*
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]
     cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
     timeoutInterval:self.timeout];
     
     [request setHTTPMethod:method];
     
     [request setValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
     */
    
    NSMutableURLRequest *request = [self.manager.requestSerializer requestWithMethod:method
                                                                           URLString:urlString
                                                                          parameters:params
                                                                               error:&error];
    [request setValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    
    if ([self.headerFields count] != 0) {
        for (NSString* key in self.headerFields) {
            NSString *value = [self.headerFields ro_stringForKey:key];
            if (value) {
                [request setValue:value forHTTPHeaderField:key];
            }
        }
    }
    
    if (error) {
        
        [self processFailure:nil error:error failureBlock:failureBlock];
        return nil;
        
    } else if (bodyParams) {
        
        NSError *jsonError = nil;
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:bodyParams
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&jsonError];
        if (jsonError) {
            
            [self processFailure:nil error:jsonError failureBlock:failureBlock];
            return nil;
            
        } else {
            
            NSString *contentJSONString = [[NSString alloc] initWithData:JSONData
                                                                encoding:NSUTF8StringEncoding];
            // Generate an NSData from your NSString (see below for link to more info)
            NSData *postBody = [contentJSONString dataUsingEncoding:NSUTF8StringEncoding];
            
            // Add Content-Length header if your server needs it
            unsigned long long postLength = postBody.length;
            NSString *contentLength = [NSString stringWithFormat:@"%llu", postLength];
            [request setValue:contentLength forHTTPHeaderField:@"Content-Length"];
            
            // This should all look familiar...
            [request setHTTPBody:postBody];
        }
        
    }
    return request;
}

- (void)processSuccess:(NSURLSessionDataTask *)task responseObject:(id)responseObject responseClass:(__unsafe_unretained Class)responseClass successBlock:(SuccessBlock)successBlock
{
    if (successBlock) {
        if (responseClass) {
            if ([responseObject isKindOfClass:[NSArray class]]) {
                NSMutableArray *objects = [NSMutableArray new];
                for (id obj in responseObject) {
                    if ([obj isKindOfClass:[NSDictionary class]]) {
                        [objects addObject:[self objectWithDictionary:obj objectClass:responseClass]];
                    }
                }
                successBlock(objects);
            } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                successBlock([self objectWithDictionary:responseObject objectClass:responseClass]);
                
            } else {
                successBlock(responseObject);
            }
        } else {
            successBlock(responseObject);
        }
    }
}

- (id)objectWithDictionary:(NSDictionary *)dic objectClass:(__unsafe_unretained Class)objectClass
{
    id object = [objectClass new];
    if ([object conformsToProtocol:@protocol(ROModelDelegate)]) {
        
        [object updateWithDictionary:dic];
        
    } else {
        
        DCParserConfiguration *config = [DCParserConfiguration configuration];
        config.datePattern = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
        DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:objectClass
                                                                 andConfiguration:config];
        object = [parser parseDictionary:dic];
        
    }
    return object;
}

- (void)processFailure:(NSURLSessionDataTask *)task error:(NSError *)error failureBlock:(FailureBlock)failureBlock
{
    ROError *roError = [ROError errorWithFn:__PRETTY_FUNCTION__
                                      error:error
                                  operation:nil];
    
    if (error && error.userInfo) {
        NSData *data= error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSString *failureResponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        roError.body = failureResponse;
    }
    
#ifdef DEBUG
    [roError log];
#endif
    if (failureBlock) {
        failureBlock(roError);
    }
}

- (AFHTTPSessionManager *)manager
{
    if (self.headerFields) {
        for (NSString* key in self.headerFields) {
            NSString *value = [self.headerFields ro_stringForKey:key];
            [_manager.requestSerializer setValue:value forHTTPHeaderField:key];
        }
    }
    return _manager;
}

#pragma mark -

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                   parameters:(nullable id)parameters
    constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> _Nonnull))block
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    return [self PUT:URLString parameters:parameters constructingBodyWithBlock:block progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                   parameters:(id)parameters
    constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                     progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.manager.requestSerializer multipartFormRequestWithMethod:@"PUT" URLString:[[NSURL URLWithString:URLString relativeToURL:self.manager.baseURL] absoluteString] parameters:parameters constructingBodyWithBlock:block error:&serializationError];
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.manager.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
        
        return nil;
    }
    
    __block NSURLSessionDataTask *task = [self.manager uploadTaskWithStreamedRequest:request progress:uploadProgress completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error) {
            if (failure) {
                failure(task, error);
            }
        } else {
            if (success) {
                success(task, responseObject);
            }
        }
    }];
    
    [task resume];
    
    return task;
}

@end
