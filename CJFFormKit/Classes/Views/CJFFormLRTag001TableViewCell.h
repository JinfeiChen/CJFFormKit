//
//  CJFFormLRTag001TableViewCell.h
//  Pods
//
//  Created by cjf on 2/12/2020.
//

#import <CJFFormKit/CJFTableViewCell.h>
#import <CJFFormKit/CJFObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormLRTag001Model : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (copy, nonatomic) NSArray <NSString *> *tags; /**< <#property#> */

@end

@interface CJFFormLRTag001TableViewCell : CJFTableViewCell

@property (strong, nonatomic) CJFFormLRTag001Model *model; /**< <#property#> */

@property (strong, nonatomic) UILabel *LTitleLabel; /**< <#property#> */
@property (assign, nonatomic) BOOL tagClickable; /**< Is the tag clickable. It is not clickable by default. */

@end

NS_ASSUME_NONNULL_END
