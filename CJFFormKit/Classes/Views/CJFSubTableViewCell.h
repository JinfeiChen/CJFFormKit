//
//  CJFTableViewCell.h
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import <CJFFormKit/CJFTableViewCell.h>
#import <CJFFormKit/CJFTableViewCellStyle.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFSubTableViewCell : CJFTableViewCell

@property (strong, nonatomic) CJFTableViewCellStyle *style; /**< <#property#> */

- (void)setModelWithDict:(NSDictionary * _Nullable)dict format:(NSDictionary * _Nullable)format;

@end

NS_ASSUME_NONNULL_END
