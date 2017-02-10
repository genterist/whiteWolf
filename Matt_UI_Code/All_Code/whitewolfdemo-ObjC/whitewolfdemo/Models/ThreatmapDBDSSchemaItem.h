//
//  ThreatmapDBDSSchemaItem.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROCloudantItem.h"
#import "ROModel.h"
#import "ThreatmapDBDSSchemaItemKeys.h"

@class CDTDocumentRevision;

@interface ThreatmapDBDSSchemaItem : NSObject <ROModelDelegate, ROCloudantItem>

@property (nonatomic, strong) NSNumber *roomId;

@property (nonatomic, strong) NSString *roomName;

@property (nonatomic, strong) NSString *roomImage;

@property (nonatomic, strong) NSString *deviceWarning;

@property (nonatomic, strong) NSString *humanWarning;

@property (nonatomic, strong) NSString *timeWarning;

@property (nonatomic, strong) NSString *breachWarning;

@property (nonatomic, strong) NSNumber *currentPeople;

@property (nonatomic, strong) NSNumber *totalTasks;

@property (nonatomic, strong) NSNumber *executingTasks;

@property (nonatomic, strong) NSNumber *missedTasks;

@property (nonatomic, strong) NSString *spacer;

@property (nonatomic, strong, readonly) CDTDocumentRevision *rev;

@end
