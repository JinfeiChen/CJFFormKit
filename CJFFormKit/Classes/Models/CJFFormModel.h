//
//  CJFFormModel.h
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import <CJFFormKit/CJFObject.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CJFFormPrivilege) {
    CJFFormPrivilege_Write = 0, // writeonly，可编辑, default
    CJFFormPrivilege_Read = 1, // readonly，不可编辑
};

@interface CJFFormModel : CJFObject

@property (copy, nonatomic) NSString *title; /**< 标题 */
@property (strong, nonatomic) id value; /**< 值 */
@property (copy, nonatomic) NSString *placeholder; /**< 占位文字 */

@property (assign, nonatomic, getter=isRequired) BOOL required; /**< 是否为必填项, default NO */
@property (assign, nonatomic, getter=isEditable) BOOL editable; /**< 是否可编辑, default NO */
@property (assign, nonatomic, getter=isSelected) BOOL selected; /**< 是否已选中, default NO */

// Reserved Parameters
@property (assign, nonatomic) CJFFormPrivilege privilege; /**< 模式：编辑、阅读 */
@property (copy, nonatomic) BOOL(^validateBlock)(CJFFormModel *model); /**< 表单校验block */

// 用于存储提交服务器数据的保留参数
@property (copy, nonatomic) NSString *IMSKey; /**< <#property#> */
@property (copy, nonatomic) NSString *IMSValue; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
