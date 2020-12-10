//
//  CJFFormTBTextField001TableViewCell.h
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBTextField001Model : CJFFormModel

@property (copy, nonatomic) NSString *placeholder; /**< <#property#> */

@end

@interface CJFFormTBTextField001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBTextField001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
