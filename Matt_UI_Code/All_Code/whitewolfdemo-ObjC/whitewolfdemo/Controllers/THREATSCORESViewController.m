//
//  THREATSCORESViewController.m.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "NSNumber+RO.h"
#import "ROListDataLoader.h"
#import "ROOptionsFilter.h"
#import "RORefreshBehavior.h"
#import "ROUtils.h"
#import "ThreatmapDBDS.h"
#import "ThreatmapDBDSSchemaItem.h"
#import "THREATSCORESViewController.h"

@interface THREATSCORESViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@end

@implementation THREATSCORESViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.layoutType = ROLayoutChartLines;

        self.dataLoader = [[ROListDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] threatmapDBDS]
                                                         optionsFilter:self.optionsFilter];
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"THREATSCORES"];

	self.navigationItem.title = NSLocalizedString(@"THREAT SCORES", nil);

    self.chartViewDelegate = self;

    self.xAxis = [[ROChartSerie alloc] initWithLabel:@"Horizontal Axis"];
    self.serie1 = [[ROChartSerie alloc] initWithLabel:@"test" atColorHexString:@"#17B9ED"];

    [self.behaviors addObject:[RORefreshBehavior behaviorViewController:self]];

    for (id<ROBehavior> behavior in self.behaviors) {
        [behavior viewDidLoad];
    }

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

#pragma mark - ROChartViewDelegate

- (void)configureSeriesAtIndex:(NSInteger)index {

    ThreatmapDBDSSchemaItem *item = self.items[index];
    [self.xAxis.values addObject:([item.totalTasks ro_stringValue] != nil ? [item.totalTasks ro_stringValue] : @"")];
    [self.serie1.values addObject:([item.executingTasks ro_stringValue] != nil ? [item.executingTasks ro_stringValue] : @0)];

}

@end

