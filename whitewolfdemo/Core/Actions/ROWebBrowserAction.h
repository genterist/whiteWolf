//
//  ROWebBrowserAction.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROUriAction.h"
#import "ROAction.h"

/**
 Open web browser with url
 */
@interface ROWebBrowserAction : ROUriAction<ROAction>

/**
 Constructor with url string
 @param urlString Url string
 @return Class instance
 */
- (id)initWithValue:(NSString *)urlString;

@end
