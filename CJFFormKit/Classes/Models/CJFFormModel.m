//
//  CJFFormModel.m
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import "CJFFormModel.h"

@implementation CJFFormModel

- (instancetype)init
{
    if (self = [super init]) {
        _required = NO;
        _editable = YES;
        _selected = NO;
        
        _validateBlock = ^BOOL(CJFFormModel * _Nonnull model) {
            return YES;
        };
    }
    return self;
}

@end
