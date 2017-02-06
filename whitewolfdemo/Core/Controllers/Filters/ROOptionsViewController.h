//
//  ROOptionsViewController.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROViewController.h"

@class ROFilterFieldSelection;

@interface ROOptionsViewController : ROViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) UISearchBar *searchBar;

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) ROFilterFieldSelection *formFieldSelection;

/**
 Configure constraints
 */
- (void)setupConstraints;

/**
 Load data
 */
- (void)loadData;

@end
