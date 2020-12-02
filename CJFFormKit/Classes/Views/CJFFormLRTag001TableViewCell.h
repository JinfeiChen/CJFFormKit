//
//  CJFFormLRTag001TableViewCell.h
//  Pods
//
//  Created by cjf on 2/12/2020.
//

#import <CJFFormKit/CJFTableViewCell.h>
#import <CJFFormKit/CJFObject.h>
#import <YYText/YYLabel.h>
#import <YYText/NSAttributedString+YYText.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormLRTag001Model : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (copy, nonatomic) NSArray <NSString *> *tags; /**< <#property#> */

@end

@interface WYTagsModel : NSObject

@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSString *color;

- (instancetype)initWithTagsDict:(NSDictionary *)dict;

@end

@interface CJFFormLRTag001TagCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel; /**< <#property#> */

@end

@interface CJFFormLRTag001TableViewCell : CJFTableViewCell

@property (strong, nonatomic) CJFFormLRTag001Model *model; /**< <#property#> */

@property (strong, nonatomic) UILabel *LTitleLabel; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
