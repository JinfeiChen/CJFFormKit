//
//  CJFFormTBSwitch001EditTableViewCell.h
//  Pods
//
//  Created by cjf on 8/12/2020.
//

#import <CJFFormKit/CJFFormTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBSwitch001EditButtonModel : CJFObject

@property (nonatomic, assign) UIControlState state;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *idField;

@end

@interface CJFFormTBSwitch001EditModel : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (copy, nonatomic) NSArray <CJFFormTBSwitch001EditButtonModel *> *value; /**< <#property#> */

@end

@interface CJFFormTBSwitch001EditTableViewCell : CJFFormTableViewCell

@property (strong, nonatomic) UILabel *TTitleLabel; /**< <#property#> */

@property (strong, nonatomic) CJFFormTBSwitch001EditModel *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
