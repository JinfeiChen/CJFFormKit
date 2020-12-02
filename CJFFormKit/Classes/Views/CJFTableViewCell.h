//
//  CJFTableViewCell.h
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFTableViewCellStyle : NSObject

@property (assign, nonatomic) UIEdgeInsets contentInset; /**< <#property#> */


@end

@interface CJFTableViewCell : UITableViewCell

@property (strong, nonatomic) CJFTableViewCellStyle *style; /**< <#property#> */

- (void)setModelWithDict:(NSDictionary * _Nullable)dict format:(NSDictionary * _Nullable)format;

@end

NS_ASSUME_NONNULL_END
