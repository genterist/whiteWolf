//
//  WHITEWOLFHAITOOLViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ABOUTUSViewController.h"
#import "DatasourceManager.h"
#import "ROBehavior.h"
#import "ROItemCell.h"
#import "RONavigationAction.h"
#import "ROPhotoTitleCollectionViewCell.h"
#import "ROStyle.h"
#import "ROUtils.h"
#import "THREATMAPViewController.h"
#import "THREATSCORESViewController.h"
#import "TODOLISTViewController.h"
#import "UIImageView+RO.h"
#import "WelcomeViewController.h"
#import "WHITEWOLFHAITOOLViewController.h"

@interface WHITEWOLFHAITOOLViewController ()

- (void)configureCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation WHITEWOLFHAITOOLViewController

static NSString * const kReuseIdentifier    = @"Cell";

static CGFloat const kMargin                = 8.0f;

- (instancetype)init {

    self = [super init];
    if (self) {

        self.numberOfColumns = 2;
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"WHITEWOLFHAITOOL"];

	self.navigationItem.title = NSLocalizedString(@"WHITE WOLF H.A.I. TOOL", nil);
	
    self.items = @[                       
                       [[ROItemCell alloc] initWithText1:@"THREAT-MAP"
                                         atImageResource:@"WarningShield100223.png"
                                                atAction:[[RONavigationAction alloc] initWithRootViewController:self destinationValue:[THREATMAPViewController class]]],
                       [[ROItemCell alloc] initWithText1:@"TO-DO"
                                         atImageResource:@"TodoListFilled100977.png"
                                                atAction:[[RONavigationAction alloc] initWithRootViewController:self destinationValue:[TODOLISTViewController class]]],
                       [[ROItemCell alloc] initWithText1:@"STATS"
                                         atImageResource:@"FuturesFilled1002303.png"
                                                atAction:[[RONavigationAction alloc] initWithRootViewController:self destinationValue:[THREATSCORESViewController class]]],
                       [[ROItemCell alloc] initWithText1:@"HELP"
                                         atImageResource:@"InformationFilled100532.png"
                                                atAction:[[RONavigationAction alloc] initWithRootViewController:self destinationValue:[WelcomeViewController class]]],
                       [[ROItemCell alloc] initWithText1:@"ABOUT US"
                                         atImageResource:@"Wolf100695.png"
                                                atAction:[[RONavigationAction alloc] initWithRootViewController:self destinationValue:[ABOUTUSViewController class]]]
                  ];

    [self.collectionView registerClass:[ROPhotoTitleCollectionViewCell class]
            forCellWithReuseIdentifier:kReuseIdentifier];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    

    for (id<ROBehavior> behavior in self.behaviors) {
        [behavior viewDidLoad];
    }
    
    [self updateViewConstraints];
}

#pragma mark - Private methods

- (void)configureCell:(ROPhotoTitleCollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    ROItemCell *item = self.items[(NSUInteger)indexPath.row];
    cell.titleLabel.text = item.text1;
    [cell.photoImageView ro_setImage:item.imageResource imageError:[[ROStyle sharedInstance] noPhotoImage]];
    if (item.action && [item.action canDoAction]) {

        cell.userInteractionEnabled = YES;

    } else {

        cell.userInteractionEnabled = NO;
    }
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
    ROItemCell *item = self.items[(NSUInteger)indexPath.row];
    if (item.action && [item.action canDoAction]) {
    
        [item.action doAction];
    }
}

@end

