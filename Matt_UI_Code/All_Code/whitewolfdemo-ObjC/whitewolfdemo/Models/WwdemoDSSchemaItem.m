//
//  WwdemoDSSchemaItem.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "WwdemoDSSchemaItem.h"
#import "CDTDocumentRevision.h"
#import "NSDictionary+RO.h"
#import "NSDate+RO.h"


@implementation WwdemoDSSchemaItem

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
    
    self.name = [dictionary ro_stringForKey:kWwdemoDSSchemaItemName];
    
    self.dob = [dictionary ro_dateForKey:kWwdemoDSSchemaItemDob];
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

- (void)setName:(NSString *)name {

    _name = name;
    self.rev.body[kWwdemoDSSchemaItemName] = name;
}

- (void)setDob:(NSDate *)dob {

    _dob = dob;
    self.rev.body[kWwdemoDSSchemaItemDob] = [dob ro_stringWithFormat:kDateFormat_ISO8601];
}

@end

