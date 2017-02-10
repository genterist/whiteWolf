//
//  TODOLISTViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "NSNumber+RO.h"
#import "ROEditRowsBehavior.h"
#import "ROListDataLoader.h"
#import "RONavigationAction.h"
#import "ROOptionsFilter.h"
#import "RORefreshBehavior.h"
#import "ROStringFilter.h"
#import "ROStyle.h"
#import "ROTableViewCell.h"
#import "ROTextStyle.h"
#import "ROUtils.h"
#import "TasksDBDS.h"
#import "TasksDBDSSchemaItem.h"
#import "TODOFormViewController.h"
#import "TODOLISTDetailViewController.h"
#import "TODOLISTViewController.h"
#import "UIImage+RO.h"
#import "UIImageView+RO.h"
#import "UILabel+RO.h"

@interface TODOLISTViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation TODOLISTViewController

static NSString * const kReuseIdentifier = @"Cell";

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROListDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] tasksDBDS]
                                                         optionsFilter:self.optionsFilter];
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"TODOLIST"];
    
    [self.optionsFilter addDesignFilter:[ROStringFilter filterWithFieldName:kTasksDBDSSchemaItemTask_status
                                                                      value:@"1"]];

    self.navigationItem.title = NSLocalizedString(@"TO-DO LIST", nil);

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    
    [self.behaviors addObject:[ROEditRowsBehavior behaviorViewController:self]];
    [self.behaviors addObject:[RORefreshBehavior behaviorViewController:self]];

    for (id<ROBehavior> behavior in self.behaviors) {
        [behavior viewDidLoad];
    }

    [self updateViewConstraints];

    [self loadData];
}

#pragma mark - Properties init

- (ROOptionsFilter *)optionsFilter {

    if (!_optionsFilter) {

        _optionsFilter = [ROOptionsFilter new];
    }
    return _optionsFilter;
}

#pragma mark - Data delegate

- (void)loadData {

    [super loadData];
}

- (void)loadDataSuccess:(id)dataObject {

    [super loadDataSuccess:dataObject];
}

- (void)loadDataError:(ROError *)error {

    [super loadDataError:error];
}

#pragma mark - Private methods

- (void)configureCell:(ROTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    TasksDBDSSchemaItem *item = self.items[(NSUInteger)indexPath.row];
    [cell.photoImageView ro_setImage:item.task_image imageError:[[ROStyle sharedInstance] noPhotoImage]];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@ ", [item.task_num ro_stringValue], item.task_details, [item.task_threatLv ro_stringValue]];
}

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ROTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    if (cell == nil) {

        cell = [[ROTableViewCell alloc] initWithROStyle:ROTableViewCellStylePhotoTitle
                                        reuseIdentifier:kReuseIdentifier];

        [cell.titleLabel ro_style:[ROTextStyle style:ROFontSizeStyleMedium
                                                bold:NO
                                              italic:NO
                                        textAligment:NSTextAlignmentLeft
                                           textColor:@"#020202"]];

        // You can customize the accessory icon ...
        UIImage *accessoryImage = [[UIImage imageNamed:@"arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *accessoryImageView = [[UIImageView alloc] initWithImage:accessoryImage];
        accessoryImageView.tintColor = [[ROStyle sharedInstance] accentColor];
        cell.accessoryView = accessoryImageView;
    }
    cell.backgroundColor = [UIColor clearColor];

    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.items count];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.preservesSuperviewLayoutMargins = NO;
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    TasksDBDSSchemaItem *item = self.items[(NSUInteger)indexPath.row];
    TODOLISTDetailViewController *destinationViewController = [TODOLISTDetailViewController new];
    destinationViewController.item = item;
    [self.navigationController pushViewController:destinationViewController
                                         animated:YES];
}

@end

