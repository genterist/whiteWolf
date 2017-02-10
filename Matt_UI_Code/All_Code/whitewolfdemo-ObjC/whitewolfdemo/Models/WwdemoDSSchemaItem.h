//
//  WwdemoDSSchemaItem.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROCloudantItem.h"
#import "ROModel.h"
#import "WwdemoDSSchemaItemKeys.h"

@class CDTDocumentRevision;

@interface WwdemoDSSchemaItem : NSObject <ROModelDelegate, ROCloudantItem>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSDate *dob;

@property (nonatomic, strong, readonly) CDTDocumentRevision *rev;

@end
