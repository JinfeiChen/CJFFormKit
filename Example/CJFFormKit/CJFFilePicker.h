//
//  CJFFilePicker.h
//  CJFFormKit_Example
//
//  Created by cjf on 23/12/2020.
//  Copyright © 2020 jinfei_chen@icloud.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFilePicker : NSObject

@property (nonatomic, strong, readonly) UIDocumentPickerViewController *documentPickerVC;

// 打开手机文件，选择上传
- (void)presentDocumentPicker;
- (void)presentDocumentPickerOn:(UIViewController *)viewController;
// 下载文件，保存到手机文件
- (void)downLoadWithFilePath:(NSString *)filePath;

@property (copy, nonatomic) void(^documentPickerFinishedBlock)(NSData *fileData, NSURL *fileURL, NSString *fileName, NSError * _Nullable error); /**< <#property#> */
@property (copy, nonatomic) void(^documentPickerCancelledBlock)(void); /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
