//
//  CJFFormTBRange001TableViewCell.h
//  Pods
//  表单控件：范围输入，e.g.价格范围，最低价-最高价
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBRange001Model : CJFFormModel

@property (copy, nonatomic) NSString *minPlaceholder; /**< <#property#> */
@property (copy, nonatomic) NSString *maxPlaceholder; /**< <#property#> */
@property (assign, nonatomic) CGFloat minValue;
@property (assign, nonatomic) CGFloat maxValue; 

@end

@interface CJFFormTBRange001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBRange001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
