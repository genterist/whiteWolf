//
//  GoogleTrendsTestDSSchemaItem.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROCloudantItem.h"
#import "ROModel.h"
#import "GoogleTrendsTestDSSchemaItemKeys.h"

@class CDTDocumentRevision;

@interface GoogleTrendsTestDSSchemaItem : NSObject <ROModelDelegate, ROCloudantItem>

@property (nonatomic, strong) NSString *country;

@property (nonatomic, strong) NSString *disease;

@property (nonatomic, strong) NSDate *time;

@property (nonatomic, strong, readonly) CDTDocumentRevision *rev;

@end
