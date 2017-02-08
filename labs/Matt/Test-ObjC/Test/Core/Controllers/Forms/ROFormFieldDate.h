//
//  ROFormFieldDate.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROFormFieldText.h"

@interface ROFormFieldDate : ROFormFieldText

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) NSString *jsonDateFormat;

@property (nonatomic, strong) UIDatePicker *datePicker;

- (void)dateChanged:(UIDatePicker *)datePicker;

@end
