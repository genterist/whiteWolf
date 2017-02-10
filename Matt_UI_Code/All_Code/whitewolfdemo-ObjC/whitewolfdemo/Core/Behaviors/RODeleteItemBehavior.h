//
//  RODeleteItemBehavior.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@protocol ROItemDelegate;
@protocol RODataDelegate;

@interface RODeleteItemBehavior : NSObject <ROBehavior, UIActionSheetDelegate>

@property (nonatomic, strong) UIViewController<RODataDelegate, ROItemDelegate> *viewController;

- (instancetype)initWithViewController:(UIViewController<RODataDelegate, ROItemDelegate> *)viewController;

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate, ROItemDelegate> *)viewController;

@end
