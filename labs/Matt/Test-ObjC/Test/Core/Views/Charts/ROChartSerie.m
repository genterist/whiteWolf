//
//  ROChartSerie.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROChartSerie.h"
#import "NSString+RO.h"

@import Colours;

@interface ROChartSerie ()

- (NSString *)calculeIndetifier;

@end

@implementation ROChartSerie

- (instancetype)initWithLabel:(NSString *)label
{
    self = [super init];
    if (self) {
        _label = label;
        _identifier = [self calculeIndetifier];
    }
    return self;
}

- (instancetype)initWithLabel:(NSString *)label atColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        _label = label;
        _color = color;
        _identifier = [self calculeIndetifier];
    }
    return self;
}

- (instancetype)initWithLabel:(NSString *)label atColorHexString:(NSString *)colorHexString
{
    self = [super init];
    if (self) {
        _label = label;
        if (colorHexString) {
            _color = [UIColor colorFromHexString:colorHexString];
        }
        _identifier = [self calculeIndetifier];
    }
    return self;
}

- (NSMutableArray *)values
{
    if (!_values) {
        _values = [NSMutableArray new];
    }
    return _values;
}

- (NSString *)identifier
{
    if (!_identifier) {
        _identifier = [self calculeIndetifier];
    }
    return _identifier;
}

- (NSString *)calculeIndetifier
{
    return [[self description] ro_md5];
}

@end
