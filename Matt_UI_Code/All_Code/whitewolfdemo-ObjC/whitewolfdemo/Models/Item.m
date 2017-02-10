//
//  Item.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "Item.h"
#import "NSDictionary+RO.h"

@implementation Item

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

	self = [super init];
	if (self) {
		[self updateWithDictionary:dictionary];
	}
	return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    self.idProp = [dictionary ro_stringForKey:kItemId];
}

- (id)identifier {
	
	return self.idProp;
}

@end

