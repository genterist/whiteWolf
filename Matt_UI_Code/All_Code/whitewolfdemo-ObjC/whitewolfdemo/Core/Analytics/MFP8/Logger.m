//
//  Analytics.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "Logger.h"
#import <IBMMobileFirstPlatformFoundation/IBMMobileFirstPlatformFoundation.h>

@implementation Logger

- (void)name:(NSString *)name log:(NSString *)message level:(ROLoggerLevel)level {

    OCLogger *ocLogger = [OCLogger getInstanceWithPackage:name];
    
    switch (level) {
            
        case ROLoggerLevelDebug:
            [ocLogger debug:message];
            break;
            
        case ROLoggerLevelError:
            [ocLogger error:message];
            break;
            
        case ROLoggerLevelFatal:
            [ocLogger fatal:message];
            break;
            
        case ROLoggerLevelInfo:
            [ocLogger info:message];
            break;
            
        case ROLoggerLevelLog:
            [ocLogger log:message];
            break;
            
        case ROLoggerLevelTrace:
            [ocLogger trace:message];
            break;
            
        case ROLoggerLevelWarn:
            [ocLogger warn:message];
            break;
            
        case ROLoggerLevelAnalytics:
            [ocLogger logWithLevel:OCLogger_ANALYTICS message:message args:nil userInfo:[NSDictionary new]];
            break;
            
        default:
            break;
    }
}

- (void)name:(NSString *)name log:(NSString *)message level:(ROLoggerLevel)level metadata:(NSDictionary *)metadata {
    
    OCLogger *ocLogger = [OCLogger getInstanceWithPackage:name];
    
    switch (level) {
            
        case ROLoggerLevelDebug:
            [ocLogger metadata:metadata debug:message];
            break;
            
        case ROLoggerLevelError:
            [ocLogger metadata:metadata error:message];
            break;
            
        case ROLoggerLevelFatal:
            [ocLogger metadata:metadata fatal:message];
            break;
            
        case ROLoggerLevelInfo:
            [ocLogger metadata:metadata info:message];
            break;
            
        case ROLoggerLevelLog:
            [ocLogger metadata:metadata log:message];
            break;
            
        case ROLoggerLevelTrace:
            [ocLogger metadata:metadata trace:message];
            break;
            
        case ROLoggerLevelWarn:
            [ocLogger metadata:metadata warn:message];
            break;
            
        case ROLoggerLevelAnalytics:
            [[WLAnalytics sharedInstance]log:message withMetadata:metadata];
            break;
            
        default:
            break;
    }
}

- (void)send {

    [OCLogger send];
}

@end
