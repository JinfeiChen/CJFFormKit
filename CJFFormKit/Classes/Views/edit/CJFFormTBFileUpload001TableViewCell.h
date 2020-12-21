//
//  CJFFormTBFileUpload001TableViewCell.h
//  Pods
//  表单控件：文件上传
//
//  Created by cjf on 15/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBFileUpload001Model : CJFFormModel

@property (strong, nonatomic) NSArray<NSString *> *value; /**< <#property#> */

@property (assign, nonatomic) NSInteger maxCount; /**< <#property#> */

@end

@interface CJFFormTBFileUpload001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBFileUpload001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
