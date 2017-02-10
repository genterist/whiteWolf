//
//  ROMapAction.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROUriAction.h"
#import "ROAction.h"

/**
 Open map with url
 */
@interface ROMapAction : ROUriAction<ROAction>

/**
 Map uri options
 */
@property (nonatomic, strong) NSString *mapUri;

/**
 Constructor with uri
 @param uri URI
 @return Class instance
 */
- (id)initWithValue:(NSString *)uri;

@end
