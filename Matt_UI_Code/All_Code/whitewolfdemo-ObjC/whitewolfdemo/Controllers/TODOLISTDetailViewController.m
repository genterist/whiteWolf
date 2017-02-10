//
//  TODOLISTDetailViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "NSDate+RO.h"
#import "NSNumber+RO.h"
#import "RODeleteItemBehavior.h"
#import "ROOptionsFilter.h"
#import "RORefreshBehavior.h"
#import "ROShareBehavior.h"
#import "ROSingleDataLoader.h"
#import "ROStyle.h"
#import "ROTextStyle.h"
#import "ROUpdateItemBehavior.h"
#import "ROUtils.h"
#import "TasksDBDS.h"
#import "TasksDBDSSchemaItem.h"
#import "TODOFormViewController.h"
#import "TODOLISTDetailViewController.h"
#import "UIImageView+RO.h"

@interface TODOLISTDetailViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@property (nonatomic, strong) UILabel *textLabel1;
@property (nonatomic, strong) UILabel *textLabel2;
@property (nonatomic, strong) UILabel *textLabel3;
@property (nonatomic, strong) UILabel *textLabel4;
@property (nonatomic, strong) UILabel *textLabel5;
@property (nonatomic, strong) UILabel *textLabel6;
@property (nonatomic, strong) UILabel *textLabel7;
@property (nonatomic, strong) UILabel *textLabel8;
@property (nonatomic, strong) UIImageView *imageView9;
@property (nonatomic, strong) UILabel *textLabel10;

@property (nonatomic, assign) BOOL didSetupConstraints;

- (void)setupConstraints;

@end

@implementation TODOLISTDetailViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROSingleDataLoader alloc] initWithDatasource:(NSObject<RODatasource> *)[[DatasourceManager sharedInstance] tasksDBDS]
                                                           optionsFilter:self.optionsFilter];
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"TODOLISTDetail"];
	
	self.textLabel1 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel1];

	
	self.textLabel2 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel2];

	
	self.textLabel3 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel3];

	
	self.textLabel4 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel4];

	
	self.textLabel5 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel5];

	
	self.textLabel6 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel6];

	
	self.textLabel7 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel7];

	
	self.textLabel8 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel8];

	self.imageView9 = [self createImageView];
	[self addSubview:self.imageView9];

	
	self.textLabel10 = [self createLabelWithTextStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]];
	[self addSubview:self.textLabel10];


    [self.behaviors addObject:[ROShareBehavior behaviorViewController:self]];
    [self.behaviors addObject:[RODeleteItemBehavior behaviorViewController:self]];
    [self.behaviors addObject:[ROUpdateItemBehavior behaviorViewController:self crudControllerClass:[TODOFormViewController class]]];
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
							@"textLabel1": self.textLabel1,
							@"textLabel2": self.textLabel2,
							@"textLabel3": self.textLabel3,
							@"textLabel4": self.textLabel4,
							@"textLabel5": self.textLabel5,
							@"textLabel6": self.textLabel6,
							@"textLabel7": self.textLabel7,
							@"textLabel8": self.textLabel8,
							@"imageView9": self.imageView9,
							@"textLabel10": self.textLabel10,
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

	self.textLabel1.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel1]-margin-|"
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

	self.textLabel4.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel4]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel5.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel5]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel6.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel6]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel7.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel7]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.textLabel8.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel8]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						   views:views]];

	self.imageView9.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView9]|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						  views:views]];

	self.textLabel10.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[textLabel10]-margin-|"
																						 options:NSLayoutFormatDirectionLeadingToTrailing
																						 metrics:metrics
																						  views:views]];

    [self.contentConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[textLabel1]-margin-[textLabel2]-margin-[textLabel3]-margin-[textLabel4]-margin-[textLabel5]-margin-[textLabel6]-margin-[textLabel7]-margin-[textLabel8]-margin-[imageView9]-margin-[textLabel10]-(>=margin)-|"
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

- (void)loadDataSuccess:(TasksDBDSSchemaItem *)item {
    [super loadDataSuccess:item];

    
	self.textLabel1.text = [item.task_num ro_stringValue];

	self.textLabel2.text = [item.task_threatLv ro_stringValue];

	self.textLabel3.text = item.task_details;

	self.textLabel4.text = item.task_status;

	self.textLabel5.text = [item.task_start_planned ro_datetimeStringValue];

	self.textLabel6.text = [item.task_start_actual ro_datetimeStringValue];

	self.textLabel7.text = [item.task_stop_planned ro_datetimeStringValue];

	self.textLabel8.text = [item.task_stop_actual ro_datetimeStringValue];

	[self.imageView9 ro_setImage:item.task_image imageError:[[ROStyle sharedInstance] noPhotoImage] containerView:self.view];

	self.textLabel10.text = [item.task_owner_id ro_stringValue];

}

- (void)loadDataError:(ROError *)error {
    [super loadDataError:error];
}

@end

