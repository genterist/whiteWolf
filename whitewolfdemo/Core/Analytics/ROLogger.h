//
//  ROLogger.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ROLoggerLevel) {
    ROLoggerLevelTrace = 0,
    ROLoggerLevelDebug = 1,
    ROLoggerLevelLog = 2,
    ROLoggerLevelInfo = 3,
    ROLoggerLevelWarn = 4,
    ROLoggerLevelError = 5,
    ROLoggerLevelFatal = 6,
    ROLoggerLevelAnalytics = 7
};

@protocol ROLogger <NSObject>

- (void)name:(NSString *)name log:(NSString *)message level:(ROLoggerLevel)level;

- (void)name:(NSString *)name log:(NSString *)message level:(ROLoggerLevel)level metadata:(NSDictionary *)metadata;

@optional

- (NSDictionary *)metadataWithObject:(id)obj;

- (void)send;

@end
