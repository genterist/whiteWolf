//
//  ROSMSAction.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROSMSAction.h"

@implementation ROSMSAction

- (id)initWithValue:(NSString *)phoneNumber
{
    NSMutableString *uri = [[NSMutableString alloc] initWithString:@"sms:"];
    if (phoneNumber) {
        [uri appendString:[phoneNumber stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    self = [super initWithUri:uri atIcon:nil];
    if (self) {
        _phoneNumber = phoneNumber;
    }
    return self;
}

@end
