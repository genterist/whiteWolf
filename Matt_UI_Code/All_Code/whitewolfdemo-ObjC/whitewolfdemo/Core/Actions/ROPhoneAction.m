//
//  ROPhoneAction.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROPhoneAction.h"
#import "UIImage+RO.h"
#import "ROUtils.h"

@implementation ROPhoneAction

- (id)initWithValue:(NSString *)phoneNumber {
    
    NSMutableString *uri = [[NSMutableString alloc] initWithString:@"telprompt:"];
    if (phoneNumber) {
        [uri appendString:[phoneNumber stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    self = [super initWithUri:uri
                       atIcon:[UIImage imageNamed:@"phone"]];
    if (self) {
        _phoneNumber = phoneNumber;
    }
    return self;
}

- (void)doAction {
    
    [super doAction];
    
    [[[ROUtils sharedInstance] analytics] logAction:@"Call to phone"
                                             target:self.phoneNumber];
}

@end
