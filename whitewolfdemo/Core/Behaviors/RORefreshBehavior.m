//
//  RORefreshBehavior.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "RORefreshBehavior.h"
#import "ROStyle.h"
#import "ROPagination.h"
#import "RODataLoader.h"
#import "ROUtils.h"
#import "RODataDelegate.h"
#import "ROSynchronize.h"
#import "RODataViewController.h"
#import "ROError.h"
#import "UIViewController+RO.h"

@import SVProgressHUD;
@import SVPullToRefresh;

@interface RORefreshBehavior ()

@property (nonatomic, strong) NSObject *datasource;

@property (nonatomic, strong) UIScrollView *scrollView;

- (void)refreshData;
- (void)refreshDataScroll;
- (void)endRefresh;

@end

@implementation RORefreshBehavior

- (instancetype)initWithViewController:(UIViewController<RODataDelegate> *)viewController {
    
    self = [super init];
    if (self) {
        
        _viewController = viewController;
    }
    return self;
}

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate> *)viewController {
    
    return [[self alloc] initWithViewController:viewController];
}

#pragma mark - Properties init

- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        
        for (id subview in self.viewController.view.subviews) {
            
            if ([subview isKindOfClass:[UIScrollView class]]) {
                
                _scrollView = (UIScrollView *)subview;
                break;
            }
        }
    }
    return _scrollView;
}

- (UIRefreshControl *)refreshControl {
    
    if (!_refreshControl) {
        
        _refreshControl = [[UIRefreshControl alloc] init];
        _refreshControl.tintColor = [[ROStyle sharedInstance] foregroundColor];
    }
    return _refreshControl;
}

- (NSObject *)datasource {

    if (!_datasource) {
    
        _datasource = [[self.viewController dataLoader] datasource];
    }
    return _datasource;
}

#pragma mark - <ROBehavior>

- (void)viewDidLoad {
    
    if (self.datasource) {
        
        if (self.scrollView && ![self.viewController isKindOfClass:[RODataViewController class]]) {
            
            [self.refreshControl addTarget:self action:@selector(refreshDataScroll) forControlEvents:UIControlEventValueChanged];
            [self.scrollView addSubview:self.refreshControl];
            
        } else {
            
            UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                           target:self
                                                                                           action:@selector(refreshData)];
            [self.viewController ro_addRightBarButtonItem:refreshButton];   
        }
    }
}

- (void)refreshData {
    
    if ([self.datasource conformsToProtocol:@protocol(ROSynchronize)]) {
    
        [(NSObject<ROSynchronize>*)self.datasource setSynchronized:NO];
    }
    
    NSString *datasourceName = NSStringFromClass([self.datasource class]);
    [[[ROUtils sharedInstance] analytics] logAction:@"refresh"
                                             target:nil
                                     datasourceName:datasourceName];
    
    id identifier;
    if ([self.viewController isKindOfClass:[RODataViewController class]]) {
    
        RODataViewController *dataViewController = (RODataViewController *)self.viewController;
        identifier = [[dataViewController item] identifier];
    }

    __weak typeof(self) weakSelf = self;
    [SVProgressHUD show];
    if (identifier) {
        
        [[self.viewController.dataLoader datasource] load:identifier onSuccess:^(id reponse) {
            
            [SVProgressHUD dismiss];
            [weakSelf.viewController loadDataSuccess:reponse];
            
        } onFailure:^(NSError *error, NSHTTPURLResponse *response) {
            
            [SVProgressHUD dismiss];
            ROError *roError = [[ROError alloc] initWithFn:__PRETTY_FUNCTION__ error:error operation:nil];
            [weakSelf.viewController loadDataError:roError];
        }];
        
    } else {

        [self.viewController.dataLoader refreshDataSuccessBlock:^(id dataObject) {
            
            [SVProgressHUD dismiss];
            [weakSelf.viewController loadDataSuccess:dataObject];
            
        } failureBlock:^(ROError *error) {
            
            [SVProgressHUD dismiss];
            [weakSelf.viewController loadDataError:error];
            
        }];
    }
}

- (void)refreshDataScroll {
    
    if ([self.datasource conformsToProtocol:@protocol(ROSynchronize)]) {
        
        [(NSObject<ROSynchronize>*)self.datasource setSynchronized:NO];
    }
    
    NSString *datasourceName = NSStringFromClass([self.datasource class]);
    [[[ROUtils sharedInstance] analytics] logAction:@"refresh"
                                             target:nil
                                     datasourceName:datasourceName];
    
    if ([self.viewController.dataLoader.datasource conformsToProtocol:@protocol(ROPagination)]) {
        
        self.scrollView.showsInfiniteScrolling = NO;
    }
    __weak typeof (self) weakSelf = self;
    [self.viewController.dataLoader refreshDataSuccessBlock:^(id dataObject) {
        
        [weakSelf endRefresh];
        [weakSelf.viewController loadDataSuccess:dataObject];
        
    } failureBlock:^(ROError *error) {
        
        [weakSelf endRefresh];
        [weakSelf.viewController loadDataError:error];
        
    }];
}

- (void)endRefresh {

    [self.refreshControl endRefreshing];
    if ([self.viewController.dataLoader.datasource conformsToProtocol:@protocol(ROPagination)]) {
        
        self.scrollView.showsInfiniteScrolling = YES;
    }
}

@end
