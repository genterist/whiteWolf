//
//  THREATMAPDetailViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "NSNumber+RO.h"
#import "RODeleteItemBehavior.h"
#import "ROOptionsFilter.h"
#import "RORefreshBehavior.h"
#import "ROShareBehavior.h"
#import "ROSingleDataLoader.h"
#import "ROTextStyle.h"
#import "ROUpdateItemBehavior.h"
#import "ROUtils.h"
#import "ThreatmapDBDS.h"
#import "ThreatmapDBDSSchemaItem.h"
#import "THREATMAPDetailViewController.h"
#import "THREATMAPFormViewController.h"

@interface THREATMAPDetailViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@property (nonatomic, strong) UILabel *textLabel1Header;
@property (nonatomic, strong) UILabel *textLabel1;
@property (nonatomic, strong) UILabel *textLabel2Header;
@property (nonatomic, strong) UILabel *textLabel2;
@property (nonatomic, strong) UILabel *textLabel3;
@property (nonatomic, strong) UILabel *textLabel4Header;
@property (nonatomic, strong) UILabel *textLabel4;

@property (nonatomic, assign) BOOL didSetupConstraints;

- (void)setupConstraints;

@end

@implementation THREATMAPDetailViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROSingleDataLoader alloc] initWithDatasource:(NSObject<RODatasource> *)[[DatasourceManager sharedInstance] threatmapDBDS]
                                                           optionsFilter:self.optionsFilter];
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"THREATMAPDetail"];
	self.textLabel1Header = [self createHeaderWithText:@"Warnings:"];
	[self addSubview:self.textLabel1Header];

	
	self.textLabel1 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel1];

	self.textLabel2Header = [self createHeaderWithText:@"Task report"];
	[self addSubview:self.textLabel2Header];

	
	self.textLabel2 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel2];

	
	self.textLabel3 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel3];

	self.textLabel4Header = [self createHeaderWithText:@"Current people"];
	[self addSubview:self.textLabel4Header];

	
	self.textLabel4 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel4];


    [self.behaviors addObject:[ROShareBehavior behaviorViewController:self]];
    [self.behaviors addObject:[ROUpdateItemBehavior behaviorViewController:self crudControllerClass:[THREATMAPFormViewController class]]];
    [self.behaviors addObject:[RODeleteItemBehavior behaviorViewController:self]];
    [self.behaviors addObject:[RORefreshBehavior behaviorViewController:self]];

    for (id<ROBehavior> behavior in self.behaviors) {
        [behavior viewDidLoad];
    }

    [self updateViewConstraints];

    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints {

    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;
        [self setupConstraints];
    }
    [super updateViewConstraints];
}

#pragma mark - Properties init

- (ROOptionsFilter *)optionsFilter {

    if (!_optionsFilter) {

        _optionsFilter = [ROOptionsFilter new];
    
    }
    return _optionsFilter;
}

#pragma mark -Private methods

- (void)setupConstraints {

    NSDictionary *views = @{
							@"scrollView": self.scrollView,
							@"contentView": self.contentView,
							@"textLabel1Header": self.textLabel1Header,
							@"textLabel1": self.textLabel1,
							@"textLabel2Header": self.textLabel2Header,
							@"textLabel2": self.textLabel2,
							@"textLabel3": self.textLabel3,
							@"textLabel4Header": self.textLabel4Header,
							@"textLabel4": self.textLabel4,
    					  };

    NSDictionary *metrics = @{
        					  @"margin": @16,
        					  @"buttonSize": @25
    						};

    [self.contentView removeConstraints:self.contentConstraints];
    [self.scrollView removeConstraints:self.scrollConstraints];
    [self.view removeConstraints:self.mainConstraints];

	self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.mainConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|"
                                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                      metrics:metrics
                                                                                        views:views]];
    
    [self.mainConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|"
                                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                      metrics:metrics
                                                                                        views:views]];
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView(scrollView)]|"
																						options:NSLayoutFormatDirectionLeadingToTrailing
																						metrics:metrics
																						  views:views]];
    
    [self.scrollConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|"
																						options:NSLayoutFormatDirectionLeadingToTrailing
																						metrics:metrics
																						  views:views]];

	self.textLabel1Header.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel1Header]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel1.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel1]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel2Header.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel2Header]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel2.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel2]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel3.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel3]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel4Header.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel4Header]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel4.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel4]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						  views:views]];

    [self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[textLabel1Header]-margin-[textLabel1]-margin-[textLabel2Header]-margin-[textLabel2]-margin-[textLabel3]-margin-[textLabel4Header]-margin-[textLabel4]-(>=margin)-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

    [self.view addConstraints:self.mainConstraints];
    [self.contentView addConstraints:self.contentConstraints];
    [self.scrollView addConstraints:self.scrollConstraints];
}

#pragma mark - <RODataDelegate>

- (void)loadData {
    [super loadData];
}

- (void)loadDataSuccess:(ThreatmapDBDSSchemaItem *)item {
    [super loadDataSuccess:item];

    self.navigationItem.title = item.roomName;
    
	self.textLabel1.text = [NSString stringWithFormat:@"Device :%@  Human: %@  Time: %@", item.deviceWarning, item.humanWarning, item.timeWarning];

	self.textLabel2.text = [NSString stringWithFormat:@"Total : %@", [item.totalTasks ro_stringValue]];

	self.textLabel3.text = [NSString stringWithFormat:@" Executing: %@     Missed : %@", [item.executingTasks ro_stringValue], [item.missedTasks ro_stringValue]];

	self.textLabel4.text = [item.currentPeople ro_stringValue];

}

- (void)loadDataError:(ROError *)error {
    [super loadDataError:error];
}

@end

