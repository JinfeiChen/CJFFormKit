//
//  CJFFormTBSlider001TableViewCell.h
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBSlider001Model : CJFFormModel

/**
 * param value: default 0.0. this value will be pinned to min/max
 */
@property (assign, nonatomic) CGFloat minValue; /**< default 0.0. the current value may change if outside new min value */
@property (assign, nonatomic) CGFloat maxValue; /**< default 1.0. the current value may change if outside new max value */

@end

@interface CJFFormTBSlider001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBSlider001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
