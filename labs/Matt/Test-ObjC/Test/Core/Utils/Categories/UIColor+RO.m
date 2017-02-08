//
//  UIColor+RO.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "UIColor+RO.h"

@import Colours;

@implementation UIColor (RO)

- (BOOL)ro_lightStyle
{
    BOOL light = YES;
    UIColor *color = [self blackOrWhiteContrastingColor];
    CGFloat distance = [color distanceFromColor:[UIColor blackColor]];
    if (!isnan(distance)) {
        if (distance != 0.0f) {
            light = NO;
        }
    }
    return light;
}

@end
