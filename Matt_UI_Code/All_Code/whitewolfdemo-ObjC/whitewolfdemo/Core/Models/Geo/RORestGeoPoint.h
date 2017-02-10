//
//  RORestGeoPoint.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROModel.h"

@interface RORestGeoPoint : NSObject <ROModelDelegate>

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSArray *coordinates;

- (NSDictionary *)jsonValue;

- (double)latitude;

- (double)longitude;

- (NSString *)stringValue;

@end
