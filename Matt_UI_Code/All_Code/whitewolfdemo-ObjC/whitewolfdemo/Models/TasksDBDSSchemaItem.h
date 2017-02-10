//
//  TasksDBDSSchemaItem.h
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROCloudantItem.h"
#import "ROModel.h"
#import "TasksDBDSSchemaItemKeys.h"

@class CDTDocumentRevision;

@interface TasksDBDSSchemaItem : NSObject <ROModelDelegate, ROCloudantItem>

@property (nonatomic, strong) NSNumber *task_num;

@property (nonatomic, strong) NSNumber *task_threatLv;

@property (nonatomic, strong) NSString *task_details;

@property (nonatomic, strong) NSString *task_status;

@property (nonatomic, strong) NSDate *task_start_planned;

@property (nonatomic, strong) NSDate *task_start_actual;

@property (nonatomic, strong) NSDate *task_stop_planned;

@property (nonatomic, strong) NSDate *task_stop_actual;

@property (nonatomic, strong) NSString *task_image;

@property (nonatomic, strong) NSNumber *task_owner_id;

@property (nonatomic, strong, readonly) CDTDocumentRevision *rev;

@end
