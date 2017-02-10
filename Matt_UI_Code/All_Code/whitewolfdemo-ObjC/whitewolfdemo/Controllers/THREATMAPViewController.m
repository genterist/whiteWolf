//
//  THREATMAPViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "ROCreateItemBehavior.h"
#import "ROEditCellsBehavior.h"
#import "ROListDataLoader.h"
#import "RONavigationAction.h"
#import "ROOptionsFilter.h"
#import "ROPhotoTitleCollectionViewCell.h"
#import "RORefreshBehavior.h"
#import "ROStyle.h"
#import "ROTextStyle.h"
#import "ROUtils.h"
#import "ThreatmapDBDS.h"
#import "ThreatmapDBDSSchemaItem.h"
#import "THREATMAPDetailViewController.h"
#import "THREATMAPFormViewController.h"
#import "THREATMAPViewController.h"
#import "UIImageView+RO.h"
#import "UILabel+RO.h"

@interface THREATMAPViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

- (void)configureCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation THREATMAPViewController

static NSString * const kReuseIdentifier    = @"Cell";

static CGFloat const kMargin                = 8.0f;

- (instancetype)init {

    self = [super init];
    if (self) {

        self.numberOfColumns = 2;

        self.dataLoader = [[ROListDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] threatmapDBDS]
                                                         optionsFilter:self.optionsFilter];
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"THREATMAP"];

	self.navigationItem.title = NSLocalizedString(@"THREAT MAP", nil);

    [self.collectionView registerClass:[ROPhotoTitleCollectionViewCell class]
            forCellWithReuseIdentifier:kReuseIdentifier];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.behaviors addObject:[ROCreateItemBehavior behaviorViewController:self crudControllerClass:[THREATMAPFormViewController class]]];
    [self.behaviors addObject:[ROEditCellsBehavior behaviorViewController:self]];
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

- (void)configureCell:(ROPhotoTitleCollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ThreatmapDBDSSchemaItem *item = self.items[(NSUInteger)indexPath.row];
    [cell.photoImageView ro_setImage:item.roomImage imageError:[[ROStyle sharedInstance] noPhotoImage]];
    cell.titleLabel.text = item.roomName;

    [cell.titleLabel ro_style:[ROTextStyle style:ROFontSizeStyleSmall
                                            bold:NO
                                          italic:NO
                                    textAligment:NSTextAlignmentCenter]];
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat minimumInteritemSpacing = [self collectionView:collectionView
                                                    layout:collectionViewLayout
                  minimumInteritemSpacingForSectionAtIndex:indexPath.section];

    CGFloat with = collectionView.frame.size.width - kMargin * 2;
    CGFloat cellWidth = floorf(with / self.numberOfColumns) - (self.numberOfColumns - 1) * minimumInteritemSpacing;
    return CGSizeMake(cellWidth, cellWidth);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return kMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return kMargin / self.numberOfColumns;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier
                                                                           forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];

    ThreatmapDBDSSchemaItem *item = self.items[(NSUInteger)indexPath.row];
    THREATMAPDetailViewController *destinationViewController = [THREATMAPDetailViewController new];
    destinationViewController.item = item;
    [self.navigationController pushViewController:destinationViewController
                                         animated:YES];
}

@end

