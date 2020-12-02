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

typedef NS_ENUM (NSUInteger, CJFFormLRTagAlignment) {
    CJFFormLRTagAlignmentLeft,
    CJFFormLRTagAlignmentRight,
    CJFFormLRTagAlignmentCenter,
};
@interface CJFFormLRTag001TagStyle : CJFObject

//标签边框
@property (nonatomic) CGFloat strokeWidth;

//标签边框颜色
@property (nullable, nonatomic, strong) UIColor *strokeColor;

//路径的连接点形状,] kCGLineJoinMiter(默认全部连接),kCGLineJoinRound(圆形连接),kCGLineJoinBevel(斜角连接)
@property (nonatomic) CGLineJoin lineJoin;

//标签内容内边距
@property (nonatomic) UIEdgeInsets insets;

//标签圆角
@property (nonatomic) CGFloat cornerRadius;

//标签填充颜色
@property (nullable, nonatomic, strong) UIColor *fillColor;

//字体大小
@property (nonatomic, strong) UIFont *_Nullable font;

//字体颜色
@property (nonatomic, strong) UIColor *_Nonnull textColor;

//标签上下间距
@property (nonatomic, assign) CGFloat lineSpace;

//标签左右间距
@property (nonatomic, assign) CGFloat space;

//标签的最大宽度-》以便计算高度
@property (nonatomic, assign) CGFloat maxWidth;

//对齐方式
@property (nonatomic, assign) CJFFormLRTagAlignment tagAlignment;

@end

//@interface CJFFormLRTag001View : YYLabel
//
//@end

@interface CJFFormLRTag001TableViewCell : CJFTableViewCell

@property (strong, nonatomic) CJFFormLRTag001Model *model; /**< <#property#> */

@property (strong, nonatomic) UILabel *LTitleLabel; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
