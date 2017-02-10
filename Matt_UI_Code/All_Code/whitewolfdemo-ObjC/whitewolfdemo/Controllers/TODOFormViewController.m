//
//  TODOFormViewController.m
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "ROError.h"
#import "ROFormFieldDatetime.h"
#import "ROFormFieldInteger.h"
#import "ROFormFieldText.h"
#import "RORefreshBehavior.h"
#import "ROUtils.h"
#import "SVProgressHUD.h"
#import "TasksDBDS.h"
#import "TasksDBDSSchemaItem.h"
#import "TODOFormViewController.h"

@interface TODOFormViewController () <UITextFieldDelegate, ROFormDataDelegate>

@property (nonatomic, strong) ROFormFieldInteger *task_numField;

@property (nonatomic, strong) ROFormFieldInteger *task_threatLvField;

@property (nonatomic, strong) ROFormFieldText *task_detailsField;

@property (nonatomic, strong) ROFormFieldText *task_statusField;

@property (nonatomic, strong) ROFormFieldDatetime *task_start_plannedField;

@property (nonatomic, strong) ROFormFieldDatetime *task_start_actualField;

@property (nonatomic, strong) ROFormFieldDatetime *task_stop_plannedField;

@property (nonatomic, strong) ROFormFieldDatetime *task_stop_actualField;

@property (nonatomic, strong) ROFormFieldText *task_imageField;

@property (nonatomic, strong) ROFormFieldInteger *task_owner_idField;

@end

@implementation TODOFormViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.formDataDelegate = self;
    }
    return self;
}

- (void) viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"TODOForm"];

    self.task_numField = [ROFormFieldInteger fieldWithLabel:@"task_num" name:kTasksDBDSSchemaItemTask_num required:NO];
    
    self.task_threatLvField = [ROFormFieldInteger fieldWithLabel:@"task_threatLv" name:kTasksDBDSSchemaItemTask_threatLv required:NO];
    
    self.task_detailsField = [ROFormFieldText fieldWithLabel:@"task_details" name:kTasksDBDSSchemaItemTask_details required:NO];
    
    self.task_statusField = [ROFormFieldText fieldWithLabel:@"task_status" name:kTasksDBDSSchemaItemTask_status required:NO];
    
    self.task_start_plannedField = [ROFormFieldDatetime fieldWithLabel:@"task_start_planned" name:kTasksDBDSSchemaItemTask_start_planned required:NO];
    
    self.task_start_actualField = [ROFormFieldDatetime fieldWithLabel:@"task_start_actual" name:kTasksDBDSSchemaItemTask_start_actual required:NO];
    
    self.task_stop_plannedField = [ROFormFieldDatetime fieldWithLabel:@"task_stop_planned" name:kTasksDBDSSchemaItemTask_stop_planned required:NO];
    
    self.task_stop_actualField = [ROFormFieldDatetime fieldWithLabel:@"task_stop_actual" name:kTasksDBDSSchemaItemTask_stop_actual required:NO];
    
    self.task_imageField = [ROFormFieldText fieldWithLabel:@"task_image" name:kTasksDBDSSchemaItemTask_image required:NO];
    
    self.task_owner_idField = [ROFormFieldInteger fieldWithLabel:@"task_owner_id" name:kTasksDBDSSchemaItemTask_owner_id required:NO];
    
    self.fields = [[NSMutableArray alloc] initWithObjects:
    
                   self.task_numField,
                   self.task_threatLvField,
                   self.task_detailsField,
                   self.task_statusField,
                   self.task_start_plannedField,
                   self.task_start_actualField,
                   self.task_stop_plannedField,
                   self.task_stop_actualField,
                   self.task_imageField,
                   self.task_owner_idField
    
                   , nil];
}

#pragma mark - Form data delegate

- (void)loadFormData:(TasksDBDSSchemaItem *)item {

    self.identifier = [item identifier];

    [self.task_numField setValue:item.task_num];
    
    [self.task_threatLvField setValue:item.task_threatLv];
    
    [self.task_detailsField setValue:item.task_details];
    
    [self.task_statusField setValue:item.task_status];
    
    [self.task_start_plannedField setValue:item.task_start_planned];
    
    [self.task_start_actualField setValue:item.task_start_actual];
    
    [self.task_stop_plannedField setValue:item.task_stop_planned];
    
    [self.task_stop_actualField setValue:item.task_stop_actual];
    
    [self.task_imageField setValue:item.task_image];
    
    [self.task_owner_idField setValue:item.task_owner_id];
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

