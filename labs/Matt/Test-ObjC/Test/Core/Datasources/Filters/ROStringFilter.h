//
//  ROStringFilter.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROFilter.h"

@interface ROStringFilter : NSObject <ROFilter>

@property (nonatomic, strong) NSString *fieldName;

@property (nonatomic, strong) NSString *fieldValue;

- (instancetype)initWithFieldName:(NSString *)fieldName value:(NSString *)value;

+ (instancetype)filterWithFieldName:(NSString *)fieldName value:(NSString *)value;

@end
