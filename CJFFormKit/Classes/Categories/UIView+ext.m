//
//  UIView+ext.m
//  Pods
//
//  Created by cjf on 11/12/2020.
//

#import "UIView+ext.h"

@implementation UIView (ext)

- (UIViewController *)viewController
{
    UIResponder *responder = self.nextResponder;
    do{
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }while (responder);

    return nil;
}

@end
