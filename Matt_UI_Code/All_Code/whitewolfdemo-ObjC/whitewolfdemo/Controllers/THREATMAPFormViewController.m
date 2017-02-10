//
//  THREATMAPFormViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "ROError.h"
#import "ROFormFieldText.h"
#import "RORefreshBehavior.h"
#import "ROUtils.h"
#import "SVProgressHUD.h"
#import "ThreatmapDBDS.h"
#import "ThreatmapDBDSSchemaItem.h"
#import "THREATMAPFormViewController.h"

@interface THREATMAPFormViewController () <UITextFieldDelegate, ROFormDataDelegate>

@property (nonatomic, strong) ROFormFieldText *spacerField;

@end

@implementation THREATMAPFormViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.formDataDelegate = self;
    }
    return self;
}

- (void) viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"THREATMAPForm"];

    self.spacerField = [ROFormFieldText fieldWithLabel:@"Note:" name:kThreatmapDBDSSchemaItemSpacer required:NO];
    
    self.fields = [[NSMutableArray alloc] initWithObjects:
    
                   self.spacerField
    
                   , nil];
}

#pragma mark - Form data delegate

- (void)loadFormData:(ThreatmapDBDSSchemaItem *)item {

    self.identifier = [item identifier];

    [self.spacerField setValue:item.spacer];
}

#pragma mark - Form actions

- (void)cancelButtonAction:(id)sender {

    [super cancelButtonAction:sender];
}

- (void)deleteButtonAction:(id)sender {

    [super deleteButtonAction:sender];
}

- (void)saveButtonAction:(id)sender {

    [super saveButtonAction:sender];
}

- (void)confirmDelete {

    [super confirmDelete];
}

- (void)deleteItem {

    [super deleteItem];
}

- (void)updateItem {

    [self.hiddenValues removeAllObjects];

    [super updateItem];
}

- (void)createItem {
    
    [super createItem];
}

@end

