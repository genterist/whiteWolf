//
//  ROCustomAction.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROBlockAction.h"

@implementation ROBlockAction

- (instancetype)initWithBlock:(ROActionBlock)actionBlock {

    self = [super init];
    if (self) {
    
        _actionBlock = actionBlock;
    }
    return self;
}

+ (instancetype)actionWithBlock:(ROActionBlock)actionBlock {

    return [[self alloc] initWithBlock:actionBlock];
}

- (void)doAction {

    _actionBlock();
}

- (BOOL)canDoAction {

    return _actionBlock ? YES : NO;
}

- (UIImage *)actionIcon {

    return nil;
}

@end
