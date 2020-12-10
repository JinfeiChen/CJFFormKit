//
//  CJFFormTBMultiSelect001TableViewCell.h
//  Pods
//  表单控件：（列表）多选下拉
//
//  Created by cjf on 9/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBMultiSelect001ItemModel : CJFObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *key; // 参数
@property (nonatomic, strong) id value;// 参数值

@end

@interface CJFFormTBMultiSelect001Model : CJFFormModel

@property (strong, nonatomic) NSArray <CJFFormTBMultiSelect001ItemModel *> *value; /**< <#property#> */

@end

@interface CJFFormTBMultiSelect001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBMultiSelect001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
