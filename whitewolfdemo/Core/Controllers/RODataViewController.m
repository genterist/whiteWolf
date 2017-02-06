//
//  RODataViewController.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "RODataViewController.h"
#import "ROError.h"

@import SVProgressHUD;

@interface RODataViewController ()

@end

@implementation RODataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - <RODataDelegate>

- (void)loadData {
    
    if (self.item) {
        
        [self loadDataSuccess:self.item];
        
    } else if (self.dataLoader.datasource) {
        
        [SVProgressHUD show];
        
        __weak typeof(self) weakSelf = self;
        [self.dataLoader refreshDataSuccessBlock:^(NSObject *item) {
            
            [SVProgressHUD dismiss];
            [weakSelf loadDataSuccess:item];
            
        } failureBlock:^(ROError *error) {
            
            [SVProgressHUD dismiss];
            [weakSelf loadDataError:error];
            
        }];
    }
}

- (void)loadDataSuccess:(NSObject *)item {
    
    if ([item conformsToProtocol:@protocol(ROModelDelegate)]) {
        self.item = (NSObject <ROModelDelegate> *)item;
    }
}

- (void)loadDataError:(ROError *)error {
    
    [error show];
}

@end
