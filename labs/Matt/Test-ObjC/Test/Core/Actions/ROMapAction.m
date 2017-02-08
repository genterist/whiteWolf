//
//  ROMapAction.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROMapAction.h"
#import "UIImage+RO.h"

@implementation ROMapAction

- (id)initWithValue:(NSString *)mapUri
{
    NSMutableString *uri = [[NSMutableString alloc] initWithString:@"http://maps.apple.com/?"];
    if (mapUri) {
        [uri appendString:[mapUri stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    self = [super initWithUri:uri
                       atIcon:[UIImage imageNamed:@"location"]];
    if (self) {
        _mapUri = mapUri;
    }
    return self;
}

@end
