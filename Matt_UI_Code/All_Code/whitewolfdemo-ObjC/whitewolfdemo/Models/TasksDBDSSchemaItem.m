//
//  TasksDBDSSchemaItem.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "TasksDBDSSchemaItem.h"
#import "CDTDocumentRevision.h"
#import "NSDictionary+RO.h"
#import "NSDate+RO.h"


@implementation TasksDBDSSchemaItem

static NSString *const kDateFormat_ISO8601 = @"yyyy-MM-dd'T'HH:mm:ss.sss'Z'";


@synthesize rev = _rev;

- (instancetype)initWithDocumentRevision:(CDTDocumentRevision *)rev {
    
    self = [super init];
    if (self) {
        
        self.rev = rev;
    }
    return self;
}

+ (instancetype)itemWithDocumentRevision:(CDTDocumentRevision *)rev {

    return [[self alloc] initWithDocumentRevision:rev];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {

        [self updateWithDictionary:dictionary];
    }
    return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    self.task_num = [dictionary ro_numberForKey:kTasksDBDSSchemaItemTask_num];
    
    self.task_threatLv = [dictionary ro_numberForKey:kTasksDBDSSchemaItemTask_threatLv];
    
    self.task_details = [dictionary ro_stringForKey:kTasksDBDSSchemaItemTask_details];
    
    self.task_status = [dictionary ro_stringForKey:kTasksDBDSSchemaItemTask_status];
    
    self.task_start_planned = [dictionary ro_dateForKey:kTasksDBDSSchemaItemTask_start_planned];
    
    self.task_start_actual = [dictionary ro_dateForKey:kTasksDBDSSchemaItemTask_start_actual];
    
    self.task_stop_planned = [dictionary ro_dateForKey:kTasksDBDSSchemaItemTask_stop_planned];
    
    self.task_stop_actual = [dictionary ro_dateForKey:kTasksDBDSSchemaItemTask_stop_actual];
    
    self.task_image = [dictionary ro_stringForKey:kTasksDBDSSchemaItemTask_image];
    
    self.task_owner_id = [dictionary ro_numberForKey:kTasksDBDSSchemaItemTask_owner_id];
}

- (id)identifier {
    
    return self.rev.docId;
}

- (CDTDocumentRevision *)rev {
    
    if (!_rev) {
        
        _rev = [CDTDocumentRevision revision];
    }
    return _rev;
}

- (void)setRev:(CDTDocumentRevision *)rev {

    _rev = rev;
    [self updateWithDictionary:rev.body];
}

- (void)setTask_num:(NSNumber *)task_num {

    _task_num = task_num;
    self.rev.body[kTasksDBDSSchemaItemTask_num] = task_num;
}

- (void)setTask_threatLv:(NSNumber *)task_threatLv {

    _task_threatLv = task_threatLv;
    self.rev.body[kTasksDBDSSchemaItemTask_threatLv] = task_threatLv;
}

- (void)setTask_details:(NSString *)task_details {

    _task_details = task_details;
    self.rev.body[kTasksDBDSSchemaItemTask_details] = task_details;
}

- (void)setTask_status:(NSString *)task_status {

    _task_status = task_status;
    self.rev.body[kTasksDBDSSchemaItemTask_status] = task_status;
}

- (void)setTask_start_planned:(NSDate *)task_start_planned {

    _task_start_planned = task_start_planned;
    self.rev.body[kTasksDBDSSchemaItemTask_start_planned] = [task_start_planned ro_stringWithFormat:kDateFormat_ISO8601];
}

- (void)setTask_start_actual:(NSDate *)task_start_actual {

    _task_start_actual = task_start_actual;
    self.rev.body[kTasksDBDSSchemaItemTask_start_actual] = [task_start_actual ro_stringWithFormat:kDateFormat_ISO8601];
}

- (void)setTask_stop_planned:(NSDate *)task_stop_planned {

    _task_stop_planned = task_stop_planned;
    self.rev.body[kTasksDBDSSchemaItemTask_stop_planned] = [task_stop_planned ro_stringWithFormat:kDateFormat_ISO8601];
}

- (void)setTask_stop_actual:(NSDate *)task_stop_actual {

    _task_stop_actual = task_stop_actual;
    self.rev.body[kTasksDBDSSchemaItemTask_stop_actual] = [task_stop_actual ro_stringWithFormat:kDateFormat_ISO8601];
}

- (void)setTask_image:(NSString *)task_image {

    _task_image = task_image;
    self.rev.body[kTasksDBDSSchemaItemTask_image] = task_image;
}

- (void)setTask_owner_id:(NSNumber *)task_owner_id {

    _task_owner_id = task_owner_id;
    self.rev.body[kTasksDBDSSchemaItemTask_owner_id] = task_owner_id;
}

@end

