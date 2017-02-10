//
//  Analytics.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "Analytics.h"
#import <IBMMobileFirstPlatformFoundation/IBMMobileFirstPlatformFoundation.h>
#import "ROUtils.h"

@implementation Analytics

static NSString *const kUrl             = @"url";
static NSString *const kMethod          = @"http_method";
static NSString *const kRequest         = @"network_request";
static NSString *const kResponse        = @"network_response";
static NSString *const kResponseCode    = @"response_code";
static NSString *const kResponseBody    = @"response_body";
static NSString *const kPage            = @"page";
static NSString *const kPageView        = @"page_view";
static NSString *const kAction          = @"action";
static NSString *const kEntity          = @"entity";
static NSString *const kIdentifier      = @"identifier";
static NSString *const kTarget          = @"target";
static NSString *const kDatasource      = @"datasource";
static NSString *const kEvent           = @"event";

- (void)setup {

    NSURL *serverURL = [[WLClient sharedInstance] serverUrl];
    NSLog(@"Connecting to server...\n%@", serverURL);
    
    NSLog(@"Testing Server Connection");
    [[WLAuthorizationManager sharedInstance] obtainAccessTokenForScope:@""
                                                 withCompletionHandler:^(AccessToken *token, NSError *error) {
                                                     
                                                     if (error != nil) {
                                                         NSLog(@"Bummer...");
                                                         NSLog(@"Failed to connect to MobileFirst Server\n%@", serverURL);
                                                         NSLog(@"Did not receive an access token from server: %@", error.description);
                                                     } else {
                                                         NSLog(@"Yay!");
                                                         NSLog(@"Connected to MobileFirst Server\n%@", serverURL);
                                                         NSLog(@"Received the following access token value: %@", token.value);
                                                     }
                                                 }];
    
    [[WLAnalytics sharedInstance] enable];

    [[WLAnalytics sharedInstance] addDeviceEventListener:LIFECYCLE];
    [[WLAnalytics sharedInstance] addDeviceEventListener:NETWORK];
    
    [[WLAnalytics sharedInstance] sendWithDelegate:nil];
}

- (void)log:(NSString *)message {

    [self log:message metadata:nil];
}

- (void)log:(NSString *)message metadata:(NSDictionary *)metadata {

    if (!metadata) {
    
        metadata = [NSDictionary new];
    }
    
    [[WLAnalytics sharedInstance] log:message
                         withMetadata:metadata];
}

- (void)send {

    [[WLAnalytics sharedInstance] send];
}

- (void)enterBackground {

}

- (void)enterForeground {

}

- (void)logRequest:(NSString *)url method:(NSString *)method {

    NSMutableDictionary *metadata = [NSMutableDictionary new];
    if (url) {
        
        [metadata setObject:url forKey:kUrl];
    }
    if (method) {
        
        [metadata setObject:method forKey:kMethod];
    }
    [[WLAnalytics sharedInstance] log:kRequest withMetadata:metadata];
}

- (void)logResponse:(NSString *)url code:(NSNumber *)code body:(id)body {

    NSMutableDictionary *metadata = [NSMutableDictionary new];
    if (url) {
        
        [metadata setObject:url forKey:kUrl];
    }
    if (code) {
        
        [metadata setObject:code forKey:kResponseCode];
    }
    if (body) {
        
        if ([body isKindOfClass:[NSDictionary class]]) {
            
            [metadata setObject:body forKey:kResponseBody];
            
        } else if ([body isKindOfClass:[NSError class]]) {
            
            [metadata setObject:[body userInfo] forKey:kResponseBody];
        }
    }
    [[WLAnalytics sharedInstance] log:kResponse withMetadata:metadata];
}

- (void)logPage:(NSString *)page {

    NSMutableDictionary *metadata = [NSMutableDictionary new];
    if (page) {
        
        [metadata setObject:page forKey:kPage];
    }
    [[WLAnalytics sharedInstance] log:kPageView withMetadata:metadata];
}

- (void)logAction:(NSString *)action entity:(NSString *)entity identifier:(NSString *)identifier {

    NSMutableDictionary *metadata = [NSMutableDictionary new];
    if (action) {
        
        [metadata setObject:action forKey:kAction];
    }
    if (entity) {
    
        [metadata setObject:entity forKey:kEntity];
    }
    if (identifier) {
    
        [metadata setObject:identifier forKey:kIdentifier];
    }
    [[WLAnalytics sharedInstance] log:kEvent withMetadata:metadata];
}

- (void)logAction:(NSString *)action entity:(NSString *)entity {

    [self logAction:action entity:entity identifier:nil];
}

- (void)logAction:(NSString *)action target:(NSString *)target datasourceName:(NSString *)datasourceName {

    NSMutableDictionary *metadata = [NSMutableDictionary new];
    if (action) {
        
        [metadata setObject:action forKey:kAction];
    }
    if (target) {
        
        [metadata setObject:target forKey:kTarget];
    }
    if (datasourceName) {
        
        [metadata setObject:datasourceName forKey:kDatasource];
    }
    [[WLAnalytics sharedInstance] log:kEvent withMetadata:metadata];
}

- (void)logAction:(NSString *)action target:(NSString *)target {
    
    [self logAction:action target:target datasourceName:nil];
}

@end
