//
//  CJFFormTBPhone001TableViewCell.h
//  Pods
//  表单控件：电话
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBPhone001Model : CJFFormModel

@property (nonatomic, copy) NSString *countryCode; // e.g. +86
@property (nonatomic, copy) NSString *countryArea; // e.g. HongKong

@end

@interface CJFFormTBPhone001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBPhone001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
