//
//  CJFFormTBSlider001TableViewCell.h
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBSlider001Model : CJFFormModel

@property (assign, nonatomic) CGFloat minValue; /**< <#property#> */
@property (assign, nonatomic) CGFloat maxValue; /**< <#property#> */

@end

@interface CJFFormTBSlider001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBSlider001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
