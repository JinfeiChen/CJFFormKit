//
//  CJFFormTBNested001TableViewCell.h
//  Pods
//  表单控件：嵌套
//
//  Created by cjf on 16/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBNested001SubModel : CJFObject

@property (copy, nonatomic) NSString *prefixText; /**< <#property#> */
@property (copy, nonatomic) NSString *text; /**< <#property#> */
@property (copy, nonatomic) NSString *placeholder; /**< <#property#> */
@property (assign, nonatomic) NSInteger selected; /**< 控制三角形指示图标的旋转，需要开发者通过数据源控制关闭 */

@end

@interface CJFFormTBNested001Model : CJFFormModel

@property (strong, nonatomic) NSArray<CJFFormTBNested001SubModel *> *value; /**< <#property#> */

@property (assign, nonatomic) NSInteger maxCount; /**< default 20 */
@property (copy, nonatomic) NSString *addButtonTitle; /**< <#property#> */
@property (copy, nonatomic) NSArray *prefixArray; /**< <#property#> */



@end

@interface CJFFormTBNested001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBNested001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
