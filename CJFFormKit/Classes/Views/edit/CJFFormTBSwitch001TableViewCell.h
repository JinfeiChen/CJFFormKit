//
//  CJFFormTBSwitch001TableViewCell.h
//  Pods
//  表单控件：单选按钮
//
//  Created by cjf on 8/12/2020.
//

#import <CJFFormKit/CJFFormTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBSwitch001ButtonModel : CJFObject

@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *idField;

@end

@interface CJFFormTBSwitch001Model : CJFFormModel

@property (strong, nonatomic) NSArray <CJFFormTBSwitch001ButtonModel *> *value; /**< <#property#> */

@end

@interface CJFFormTBSwitch001TableViewCell : CJFFormTableViewCell

@property (strong, nonatomic) UILabel *TTitleLabel; /**< <#property#> */

@property (strong, nonatomic) CJFFormTBSwitch001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
