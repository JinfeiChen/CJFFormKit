//
//  CJFFormTableViewCell.h
//  CJFFormKit
//
//  Created by cjf on 8/12/2020.
//

#import <UIKit/UIKit.h>

#import <CJFFormKit/CJFFormModel.h>

#import <Masonry/Masonry.h>

#import <YYModel/YYModel.h>
#import <YYText/YYLabel.h>
#import <YYText/NSAttributedString+YYText.h>
#import <YYText/YYTextView.h>
#import <YYWebImage/YYWebImage.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enums

typedef NS_ENUM(NSUInteger, CJFFormTableViewCellType) {
    CJFFormTableViewCellType_LR002, // read, 左右布局：左标题，右文字
    CJFFormTableViewCellType_LRTag001, // read, 左右布局：左标题，右标签列表
    CJFFormTableViewCellType_FFGrid001, // read, 横向满铺：每行固定列数，默认3列/行
    CJFFormTableViewCellType_Edit_TBSwitch001, // edit, 上下布局：上标题，下Switch(两个单选按钮)
};

#pragma mark - Defines

#define kFormSectionHeader @"header"
#define kFormSectionBody @"body"
#define kFormSectionFooter @"footer"

#define kFormItemClassKey @"class"
#define kFormItemTitleKey @"title"
#define kFormItemValueKey @"value"
#define kFormItemSelectorKey @"defaultEvent"
#define kFormItemCustomSelectorKey @"customEvent"
#define kFormItemPlaceholderKey @"placeholder"
#define kFormItemRequiredKey @"required"
#define kFormItemEditableKey @"editable"

/**
 * Example:
 * NSDictionary *exampleDict = @{
    kFormSectionHeader: @{},
    kFormSectionBody: @[
        @{
            kFormItemClassKey: @"CJFFormTableViewCell",
            kFormItemTitleKey: @"MyTitle",
            kFormItemValueKey: @"MyValue"
        }
    ],
    kFromSectionFooter: @{}
 * };
 * NSArray *tableViewDataSource = @[exampleDict1, exampleDict2, ...];
 */

@class CJFFormTableViewCellStyle;
@interface CJFFormTableViewCell : UITableViewCell

+ (CJFFormTableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath dataSource:(NSDictionary *)dataSource;

@property (strong, nonatomic) CJFFormTableViewCellStyle *cellStyle; /**< <#property#> */
@property (strong, nonatomic) NSIndexPath *indexPath; /**< <#property#> */
@property (weak, nonatomic) UITableView *tableView; /**< <#property#> */

@property (strong, nonatomic) CJFFormModel *model; /**< <#property#> */

- (void)setModelWithDict:(NSDictionary * _Nullable)dict format:(NSDictionary * _Nullable)format;

@property (copy, nonatomic) void(^didUpdateFormModelBlock)(CJFFormTableViewCell *cell, CJFFormModel *model, id _Nullable reservedObj); /**< 默认数据源更新事件， reservedObj 预留参数 */
@property (copy, nonatomic) void(^customDidSelectedBlock)(CJFFormTableViewCell *cell, CJFFormModel *model, id _Nullable reservedObj); /**< 自定义点击事件， reservedObj 预留参数 */

@end

@interface CJFFormTableViewCellStyle : NSObject

@property (assign, nonatomic) UIEdgeInsets contentInset; /**< <#property#> */

@property (strong, nonatomic) UIColor *titleColor; /**< <#property#> */
@property (strong, nonatomic) UIFont *titleFont; /**< <#property#> */

@property (strong, nonatomic) UIColor *backgroundColor; /**< <#property#> */

@property (strong, nonatomic) UIColor *valueColor; /**< <#property#> */
@property (strong, nonatomic) UIFont *valueFont; /**< <#property#> */

@property (strong, nonatomic) UIColor *placeholderColor; /**< <#property#> */

@property (assign, nonatomic) CGFloat spacing; /**< cell内控件间距，default 10.0 */

+ (instancetype)defaultCellStyle;

@end

NS_ASSUME_NONNULL_END
