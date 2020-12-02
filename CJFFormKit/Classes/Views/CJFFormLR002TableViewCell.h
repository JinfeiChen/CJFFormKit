//
//  CJFFormLR002TableViewCell.h
//  Pods
//
//  Created by cjf on 1/12/2020.
//

#import <CJFFormKit/CJFTableViewCell.h>
#import <CJFFormKit/CJFObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormLR002Model : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (copy, nonatomic) NSString *value; /**< <#property#> */

@end

@interface CJFFormLR002TableViewCell : CJFTableViewCell

@property (strong, nonatomic) UILabel *LTitleLabel; /**< <#property#> */
@property (strong, nonatomic) UILabel *RValueLabel; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
