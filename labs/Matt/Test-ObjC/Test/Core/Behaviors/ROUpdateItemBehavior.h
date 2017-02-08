//
//  ROUpdateItemBehavior.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@protocol RODataDelegate;
@protocol ROItemDelegate;

@interface ROUpdateItemBehavior : NSObject <ROBehavior>

@property (nonatomic, strong) Class crudControllerClass;

@property (nonatomic, strong) UIViewController<RODataDelegate, ROItemDelegate> *viewController;

- (instancetype)initWithViewController:(UIViewController<RODataDelegate, ROItemDelegate> *)viewController crudControllerClass:(__unsafe_unretained Class)crudControllerClass;

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate, ROItemDelegate> *)viewController crudControllerClass:(__unsafe_unretained Class)crudControllerClass;

@end
