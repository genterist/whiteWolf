//
//  ROFormFieldSwitch.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROFormFieldDelegate.h"

@class ROSwitchTableViewCell;

@interface ROFormFieldSwitch : NSObject <ROFormFieldDelegate>

@property (nonatomic, strong) NSString *label;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) UISwitch *check;

@property (nonatomic, strong) id value;

- (instancetype)initWithLabel:(NSString *)label
                         name:(NSString *)name;

+ (instancetype)fieldWithLabel:(NSString *)label
                          name:(NSString *)name;

- (ROSwitchTableViewCell *)fieldCell;

- (BOOL)fieldValue;

- (void)changeSwitch:(id)sender;

@end
