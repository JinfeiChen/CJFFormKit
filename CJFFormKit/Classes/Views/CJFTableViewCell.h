//
//  CJFTableViewCell.h
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <YYModel/YYModel.h>
#import <YYWebImage/YYWebImage.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CJFTableViewCellType) {
    CJFTableViewCellType_LR001,
    CJFTableViewCellType_LR002,
    CJFTableViewCellType_LRTag001,
    CJFTableViewCellType_FFGrid001,
};

@interface CJFTableViewCellStyle : NSObject

@property (assign, nonatomic) UIEdgeInsets contentInset; /**< <#property#> */


@end

@interface CJFTableViewCell : UITableViewCell

@property (strong, nonatomic) CJFTableViewCellStyle *cellStyle; /**< <#property#> */

- (void)setModelWithDict:(NSDictionary * _Nullable)dict format:(NSDictionary * _Nullable)format;

@end

NS_ASSUME_NONNULL_END
