//
//  ROCollectionLocalDatasource.h
//  Test
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROObject.h"
#import "RODatasource.h"
#import "ROPagination.h"

@interface ROCollectionLocalDatasource : ROObject<RODatasource,ROPagination>

@property (nonatomic, assign) Class objectsClass;
@property (nonatomic, strong) NSArray *objects;

- (id)initWithObjectsClass:(Class)objectsClass;

@end
