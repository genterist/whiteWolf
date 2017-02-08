//
//  ROSearchBehavior.m
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROSearchBehavior.h"
#import "ROStyle.h"
#import "NSString+RO.h"
#import "ROOptionsFilter.h"
#import "RODataLoader.h"
#import "ROUtils.h"
#import "RODataDelegate.h"

@interface ROSearchBehavior ()

@property (nonatomic, strong) UIScrollView *scrollView;

- (void)configureInsets;

@end

@implementation ROSearchBehavior

static float const kSearchBarHeight = 44.0f;

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

- (void)dealloc {

    if (self.scrollView) {
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

#pragma mark - Properties init

- (UISearchBar *)searchBar {
    
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.tintColor = [[ROStyle sharedInstance] applicationBarTextColor];
        _searchBar.barTintColor = [[ROStyle sharedInstance] applicationBarBackgroundColor];
        
        // Hide clear button
        NSArray *subviews = _searchBar.subviews.count == 1 ? [_searchBar.subviews.firstObject subviews] : _searchBar.subviews;
        for (id view in subviews) {
            
            if ([view isKindOfClass:[UITextField class]]) {
                
                UITextField *textField = (UITextField *)view;
                textField.clearButtonMode = UITextFieldViewModeNever;
                break;
            }
        }
    }
    return _searchBar;
}

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

- (void)viewDidLoad {
    
    self.searchBar.delegate = self;
    
    [self.viewController.view addSubview:self.searchBar];
    
    NSDictionary *viewsBindings = @{
                                    @"searchBar" : self.searchBar,
                                    @"topView": self.viewController.topLayoutGuide
                                    };
    
    NSDictionary *metrics = @{
                              @"searchBarHeight": @(kSearchBarHeight)
                              };
    
    [self.viewController.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[searchBar]|"
                                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                     metrics:metrics
                                                                                       views:viewsBindings]];
    
    [self.viewController.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topView][searchBar(searchBarHeight)]"
                                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                     metrics:metrics
                                                                                       views:viewsBindings]];
    
    if (self.scrollView) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(configureInsets)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
        
        [self configureInsets];
    }
}

- (void)configureInsets {

    dispatch_async(dispatch_get_main_queue(), ^{
        
        float top = [self.viewController.topLayoutGuide length];
        UIEdgeInsets scrollInstes = self.scrollView.contentInset;
        scrollInstes.top = top + kSearchBarHeight;
        self.scrollView.contentInset = scrollInstes;
        
    });
}

#pragma mark - Search bar delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    if (!searchBar.showsCancelButton) {
        
        [searchBar setShowsCancelButton:YES animated:YES];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    if (searchBar.showsCancelButton) {
        
        [searchBar setShowsCancelButton:NO animated:YES];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    if (searchBar.text && [[searchBar.text ro_trim] length] != 0) {
        
        [self search:searchBar.text];
        
    } else {
        
        [self search:nil];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.text = nil;
    [self search:nil];
}

- (void)search:(NSString *)searchText {
    
    [self.viewController.view endEditing:YES];
    ROOptionsFilter *optionsFilter = [[self.viewController dataLoader] optionsFilter];
    optionsFilter.searchText = searchText;
    [[self.viewController dataLoader] setOptionsFilter:optionsFilter];
    [self.viewController loadData];
    
    if (searchText) {
        
        NSString *datasourceName = NSStringFromClass([[[self.viewController dataLoader] datasource] class]);
        [[[ROUtils sharedInstance] analytics] logAction:@"search"
                                                 target:searchText
                                         datasourceName:datasourceName];
    }
}

@end
