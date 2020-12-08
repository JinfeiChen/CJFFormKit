//
//  CJFFormLR002TableViewCell.h
//  Pods
//  布局：左右，左标题，右内容
//
//  Created by cjf on 1/12/2020.
//

#import <CJFFormKit/CJFFormTableViewCell.h>
#import <CJFFormKit/CJFObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormLR002Model : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (copy, nonatomic) NSString *value; /**< <#property#> */

@end

@interface CJFFormLR002TableViewCell : CJFFormTableViewCell

@property (strong, nonatomic) UILabel *LTitleLabel; /**< <#property#> */
@property (strong, nonatomic) UILabel *RValueLabel; /**< <#property#> */

@property (strong, nonatomic) CJFFormLR002Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
