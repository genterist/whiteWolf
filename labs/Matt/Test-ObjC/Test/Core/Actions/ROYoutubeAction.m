//
//  ROYoutubeAction.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROYoutubeAction.h"
#import "UIImage+RO.h"

@implementation ROYoutubeAction

- (id)initWithVideoId:(NSString *)videoId
{
    NSMutableString *uri = [[NSMutableString alloc] initWithString:@"http://www.youtube.com/watch?v="];
    if (videoId) {
        [uri appendString:[videoId stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    self = [super initWithUri:uri atIcon:[UIImage imageNamed:@"Playvideo"]];
    if (self) {
        _videoId = videoId;
    }
    return self;
}

- (id)initWithValue:(NSString *)videoUrl
{
    NSString *uri = @"";
    if (videoUrl) {
        uri = [videoUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    self = [super initWithUri:uri
                       atIcon:[UIImage imageNamed:@"Playvideo"]];
    if (self) {
        _videoUrl = videoUrl;
    }
    return self;
}

@end
