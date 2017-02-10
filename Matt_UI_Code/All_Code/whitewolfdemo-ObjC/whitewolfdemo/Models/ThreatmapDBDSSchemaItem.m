//
//  ThreatmapDBDSSchemaItem.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ThreatmapDBDSSchemaItem.h"
#import "CDTDocumentRevision.h"
#import "NSDictionary+RO.h"

@implementation ThreatmapDBDSSchemaItem

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
    
    self.roomId = [dictionary ro_numberForKey:kThreatmapDBDSSchemaItemRoomId];
    
    self.roomName = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemRoomName];
    
    self.roomImage = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemRoomImage];
    
    self.deviceWarning = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemDeviceWarning];
    
    self.humanWarning = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemHumanWarning];
    
    self.timeWarning = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemTimeWarning];
    
    self.breachWarning = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemBreachWarning];
    
    self.currentPeople = [dictionary ro_numberForKey:kThreatmapDBDSSchemaItemCurrentPeople];
    
    self.totalTasks = [dictionary ro_numberForKey:kThreatmapDBDSSchemaItemTotalTasks];
    
    self.executingTasks = [dictionary ro_numberForKey:kThreatmapDBDSSchemaItemExecutingTasks];
    
    self.missedTasks = [dictionary ro_numberForKey:kThreatmapDBDSSchemaItemMissedTasks];
    
    self.spacer = [dictionary ro_stringForKey:kThreatmapDBDSSchemaItemSpacer];
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

- (void)setRoomId:(NSNumber *)roomId {

    _roomId = roomId;
    self.rev.body[kThreatmapDBDSSchemaItemRoomId] = roomId;
}

- (void)setRoomName:(NSString *)roomName {

    _roomName = roomName;
    self.rev.body[kThreatmapDBDSSchemaItemRoomName] = roomName;
}

- (void)setRoomImage:(NSString *)roomImage {

    _roomImage = roomImage;
    self.rev.body[kThreatmapDBDSSchemaItemRoomImage] = roomImage;
}

- (void)setDeviceWarning:(NSString *)deviceWarning {

    _deviceWarning = deviceWarning;
    self.rev.body[kThreatmapDBDSSchemaItemDeviceWarning] = deviceWarning;
}

- (void)setHumanWarning:(NSString *)humanWarning {

    _humanWarning = humanWarning;
    self.rev.body[kThreatmapDBDSSchemaItemHumanWarning] = humanWarning;
}

- (void)setTimeWarning:(NSString *)timeWarning {

    _timeWarning = timeWarning;
    self.rev.body[kThreatmapDBDSSchemaItemTimeWarning] = timeWarning;
}

- (void)setBreachWarning:(NSString *)breachWarning {

    _breachWarning = breachWarning;
    self.rev.body[kThreatmapDBDSSchemaItemBreachWarning] = breachWarning;
}

- (void)setCurrentPeople:(NSNumber *)currentPeople {

    _currentPeople = currentPeople;
    self.rev.body[kThreatmapDBDSSchemaItemCurrentPeople] = currentPeople;
}

- (void)setTotalTasks:(NSNumber *)totalTasks {

    _totalTasks = totalTasks;
    self.rev.body[kThreatmapDBDSSchemaItemTotalTasks] = totalTasks;
}

- (void)setExecutingTasks:(NSNumber *)executingTasks {

    _executingTasks = executingTasks;
    self.rev.body[kThreatmapDBDSSchemaItemExecutingTasks] = executingTasks;
}

- (void)setMissedTasks:(NSNumber *)missedTasks {

    _missedTasks = missedTasks;
    self.rev.body[kThreatmapDBDSSchemaItemMissedTasks] = missedTasks;
}

- (void)setSpacer:(NSString *)spacer {

    _spacer = spacer;
    self.rev.body[kThreatmapDBDSSchemaItemSpacer] = spacer;
}

@end

