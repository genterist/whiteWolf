//
//  ROLoginService.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROBasicAuthLoginService.h"
#import "ROLoginResponse.h"
#import "RORestClient.h"
#import "ROError.h"

@interface ROBasicAuthLoginService ()

@property (nonatomic, strong) RORestClient *restClient;

@end

@implementation ROBasicAuthLoginService

- (instancetype)initWithBaseUrl:(NSString *)baseUrl appId:(NSString *)appId {
    
    self = [super init];
    if (self) {
        
        _baseUrl = baseUrl;
        _appId = appId;
    }
    return self;
}

- (RORestClient *)restClient {
    
    if (!_restClient) {
        
        _restClient = [[RORestClient alloc] initWithBaseUrlString:self.baseUrl timeout:30];
    }
    return _restClient;
}

- (void)loginUser:(NSString *)user
     withPassword:(NSString *)password
          success:(ROLoginServiceSuccessBlock)success
          failure:(ROLoginServiceFailureBlock)failure {
    
    NSString *path = [NSString stringWithFormat:@"login/%@", self.appId];
    // set http basic auth
    [self.restClient.manager.requestSerializer clearAuthorizationHeader];
    [self.restClient.manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [self.restClient.manager.requestSerializer setAuthorizationHeaderFieldWithUsername:user password:password];
    [self.restClient post:path params:nil responseClass:[ROLoginResponse class] successBlock:^(id response) {
        
        if (success) {
            success(response);
        }
        
    } failureBlock:^(ROError *error) {
        
        if (failure) {
            failure(error.error, nil);
        }
        
    }];
}

@end
