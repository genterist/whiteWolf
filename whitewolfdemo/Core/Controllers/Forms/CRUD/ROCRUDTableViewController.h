//
//  ROCRUDTableViewController.h
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROFormTableViewController.h"
#import "ROCreateItemDelegate.h"
#import "ROUpdateItemDelegate.h"
#import "RODeleteItemDelegate.h"
#import "ROCRUDServiceDelegate.h"

@protocol ROFormDataDelegate <NSObject>

- (void)loadFormData:(NSObject *)item;

@end

@interface ROCRUDTableViewController : ROFormTableViewController <UIActionSheetDelegate>

@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, strong) NSObject *item;

@property (nonatomic, weak) id<ROCRUDServiceDelegate> crudService;

@property (nonatomic, weak) id<ROCreateItemDelegate> createDelegate;

@property (nonatomic, weak) id<ROUpdateItemDelegate> updateDelegate;

@property (nonatomic, weak) id<RODeleteItemDelegate> deleteDelegate;

@property (nonatomic, weak) id<ROFormDataDelegate> formDataDelegate;

- (BOOL)showDeleteButton;

- (BOOL)isEditMode;

- (void)cancelButtonAction:(id)sender;

- (void)deleteButtonAction:(id)sender;

- (void)saveButtonAction:(id)sender;

- (void)confirmDelete;

- (void)deleteItem;

- (void)saveItem;

- (void)createItem;

- (void)updateItem;

@end
