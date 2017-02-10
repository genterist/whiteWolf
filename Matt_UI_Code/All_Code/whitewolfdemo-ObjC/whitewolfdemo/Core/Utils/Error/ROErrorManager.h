//
//  ROErrorManager.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class ROError;

@interface ROErrorManager : NSObject

@property (nonatomic, strong) NSMutableArray *errors;

+ (instancetype)sharedInstance;

- (void)addError:(ROError *)error;

- (void)processError:(ROError *)error;

@end
