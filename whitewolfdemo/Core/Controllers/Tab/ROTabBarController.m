//
//  ROTabBarController.m
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROTabBarController.h"
#import "ROStyle.h"

@interface ROTabBarController () <UITableViewDataSource, UITabBarControllerDelegate>

@property (nonatomic, weak, nullable) id <UITableViewDataSource> moreDataSource;

@end

@implementation ROTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[ROStyle sharedInstance] backgroundColor];
    self.view.tintColor = [[ROStyle sharedInstance] foregroundColor];
    
    if (self.moreNavigationController.topViewController != nil && [self.moreNavigationController.topViewController.view isKindOfClass:[UITableView class]]) {
        
        UITableView *tableView = (UITableView *)self.moreNavigationController.topViewController.view;
        tableView.backgroundView = nil;
        tableView.backgroundColor = [UIColor clearColor];
        self.moreDataSource = tableView.dataSource;
        tableView.dataSource = self;
    }
    
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.moreDataSource tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.moreDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView = nil;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [[ROStyle sharedInstance] font];
    cell.textLabel.textColor = [[ROStyle sharedInstance] foregroundColor];
    
    UIImage *icon = [[UIImage imageNamed:@"arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *accessoryView = [[UIImageView alloc] initWithImage:icon];
    [accessoryView setTintColor:[[ROStyle sharedInstance] foregroundColor]];
    cell.accessoryView = accessoryView;
    
    return cell;
}

#pragma mark - <UITabBarControllerDelegate>

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    
    NSArray *subviews = tabBarController.view.subviews;
    if ([subviews count] > 1) {
        UIView *editView = subviews[1];
        editView.backgroundColor = [[ROStyle sharedInstance] backgroundColor];
    }
}

@end
