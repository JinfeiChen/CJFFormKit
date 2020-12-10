//
//  CJFFormModel.h
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import <CJFFormKit/CJFObject.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CJFFormPrivilege) {
    CJFFormPrivilege_Write, // writeonly
    CJFFormPrivilege_Read, // readonly
};

@interface CJFFormModel : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (strong, nonatomic) id value; /**< <#property#> */

@property (assign, nonatomic) CJFFormPrivilege privilege; /**< <#property#> */
@property (assign, nonatomic, getter=isSelected) BOOL selected; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
