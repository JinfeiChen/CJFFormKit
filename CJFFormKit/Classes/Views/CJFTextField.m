//
//  CJFTextField.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFTextField.h"

@implementation CJFTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible=NO;
    }
    return NO;
}

@end
