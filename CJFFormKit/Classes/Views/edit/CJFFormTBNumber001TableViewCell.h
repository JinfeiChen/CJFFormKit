//
//  CJFFormTBNumber001TableViewCell.h
//  Pods
//  表单控件：数值输入，左右按钮控制减少和增加
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBNumber001Model : CJFFormModel

@property (assign, nonatomic) CGFloat increment; /**< default 1.0 */
@property (assign, nonatomic) CGFloat minValue; /**< default 0.0 */
@property (assign, nonatomic) CGFloat maxValue; /**< default 10000.0 */
@property (assign, nonatomic) NSInteger digits; /**< default 0, 小数点位数 */

@end

@interface CJFFormTBNumber001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBNumber001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
