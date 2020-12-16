//
//  CJFFormTBFileUpload001TableViewCell.h
//  Pods
//
//  Created by cjf on 15/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBFileUpload001Model : CJFFormModel

@property (strong, nonatomic) NSArray<NSString *> *value; /**< <#property#> */

@end

@interface CJFFormTBFileUpload001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBFileUpload001Model *model; /**< <#property#> */

@property (copy, nonatomic) void(^testBlock)(id obj); /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
