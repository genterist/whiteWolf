//
//  ROSearchBehavior.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@protocol RODataDelegate;

@interface ROSearchBehavior : NSObject <ROBehavior, UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UIViewController<RODataDelegate> *viewController;

- (instancetype)initWithViewController:(UIViewController<RODataDelegate> *)viewController;

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate> *)viewController;

- (void)search:(NSString *)searchText;

@end
