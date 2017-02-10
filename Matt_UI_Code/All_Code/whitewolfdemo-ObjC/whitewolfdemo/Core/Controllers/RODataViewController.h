//
//  RODataViewController.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROScrollViewController.h"
#import "ROModel.h"
#import "RODataDelegate.h"
#import "ROItemDelegate.h"

@interface RODataViewController : ROScrollViewController <RODataDelegate, ROItemDelegate>

@property (nonatomic, strong) NSObject<ROModelDelegate> *item;

@property (nonatomic, strong) NSObject<RODataLoader> *dataLoader;

@end
