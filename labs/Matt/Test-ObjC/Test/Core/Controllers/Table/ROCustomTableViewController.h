//
//  RODetailViewController.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROViewController.h"
#import "RODataDelegate.h"
#import "ROItemDelegate.h"

@protocol ROCustomTableViewDelegate <NSObject>

- (void)setItem:(NSObject *)item;

- (void)configureWithDataItem:(NSObject *)dataItem;

@end

@interface ROCustomTableViewController : ROViewController <RODataDelegate, ROItemDelegate, UITableViewDataSource, UITableViewDelegate>

/**
 *  Table view
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  Table view style
 */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/**
 *  Items to load
 */
@property (nonatomic, strong) NSArray *items;

/**
 Custom object to show
 */
@property (nonatomic, strong) NSObject *item;

/**
 ROCustomTableViewDelegate
 */
@property (nonatomic, weak) id<ROCustomTableViewDelegate> customTableViewDelegate;

@end
