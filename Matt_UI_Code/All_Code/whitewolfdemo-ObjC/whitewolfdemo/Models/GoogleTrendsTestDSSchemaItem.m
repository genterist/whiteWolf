//
//  GoogleTrendsTestDSSchemaItem.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "GoogleTrendsTestDSSchemaItem.h"
#import "CDTDocumentRevision.h"
#import "NSDictionary+RO.h"
#import "NSDate+RO.h"


@implementation GoogleTrendsTestDSSchemaItem

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
    
    self.country = [dictionary ro_stringForKey:kGoogleTrendsTestDSSchemaItemCountry];
    
    self.disease = [dictionary ro_stringForKey:kGoogleTrendsTestDSSchemaItemDisease];
    
    self.time = [dictionary ro_dateForKey:kGoogleTrendsTestDSSchemaItemTime];
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

- (void)setCountry:(NSString *)country {

    _country = country;
    self.rev.body[kGoogleTrendsTestDSSchemaItemCountry] = country;
}

- (void)setDisease:(NSString *)disease {

    _disease = disease;
    self.rev.body[kGoogleTrendsTestDSSchemaItemDisease] = disease;
}

- (void)setTime:(NSDate *)time {

    _time = time;
    self.rev.body[kGoogleTrendsTestDSSchemaItemTime] = [time ro_stringWithFormat:kDateFormat_ISO8601];
}

@end

