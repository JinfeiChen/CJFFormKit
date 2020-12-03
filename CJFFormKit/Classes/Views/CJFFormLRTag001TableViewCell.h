//
//  CJFFormLRTag001TableViewCell.h
//  Pods
//  布局：左标题，右标签列表（标签为左对齐）
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

@property (assign, nonatomic) CGFloat autoCacheHeight; /**< 自动缓存高度 */

@end

@interface WYTagsModel : NSObject

@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSString *color;

- (instancetype)initWithTagsDict:(NSDictionary *)dict;

@end

@interface CJFFormLRTag001TagCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel; /**< <#property#> */

@end

// 创建UICollectionViewFlowLayout子类，实现当每一行的item宽度加起来小于collectionView的contentSize.width时，所有item左对齐布局（默认是自动拉伸item间距）
@interface CJFFormLRTag001TagCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (assign, nonatomic) CGFloat maximumInteritemSpacing; /**< <#property#> */

@end

// 建议缓存tableViewCell的高度，减少不必要的高度计算
@interface CJFFormLRTag001TableViewCell : CJFTableViewCell

@property (strong, nonatomic) CJFFormLRTag001Model *model; /**< <#property#> */

@property (strong, nonatomic) UILabel *LTitleLabel; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
