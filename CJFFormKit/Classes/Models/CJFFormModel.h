//
//  CJFFormModel.h
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import <CJFFormKit/CJFObject.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CJFormPrivilege) {
    CJFormPrivilege_Read, // readonly
    CJFormPrivilege_Write, // writeonly
};

@interface CJFFormModel : CJFObject

@property (copy, nonatomic) NSString *title; /**< <#property#> */
@property (strong, nonatomic) id value; /**< <#property#> */

@property (assign, nonatomic) CJFormPrivilege privilege; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
