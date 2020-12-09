//
//  CJFFormTBInputSearch001TableViewCell.h
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBInputSearch001Model : CJFFormModel

@property (copy, nonatomic) NSString *placeholder; /**< <#property#> */

@end

@interface CJFFormTBInputSearch001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBInputSearch001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
