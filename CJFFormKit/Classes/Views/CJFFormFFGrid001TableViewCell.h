//
//  CJFFormFFGrid001TableViewCell.h
//  Pods
//  布局：网格，item为左图片+右文字
//
//  Created by cjf on 3/12/2020.
//

#import <CJFFormKit/CJFFormTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormFFGrid001ItemModel : CJFObject

@property (copy, nonatomic) NSString *imageUrl; /**< <#property#> */
@property (copy, nonatomic) NSString *value; /**< <#property#> */

@end

@interface CJFFormFFGrid001Model : CJFFormModel

@property (strong, nonatomic) NSArray <CJFFormFFGrid001ItemModel *> *value; /**< <#property#> */

@end

@interface CJFFormFFGrid001SubCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (assign, nonatomic) NSInteger columns; /**< <#property#> */
@property (assign, nonatomic) CGFloat fixedItemHeight; /**< <#property#> */

@end

@interface CJFFormFFGrid001TableViewCell : CJFFormTableViewCell

@property (strong, nonatomic) CJFFormFFGrid001Model *model; /**< <#property#> */

@property (strong, nonatomic) CJFFormFFGrid001SubCollectionViewFlowLayout *flowLayout; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
