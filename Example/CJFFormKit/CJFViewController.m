//
//  CJFViewController.m
//  CJFFormKit
//
//  Created by jinfei_chen@icloud.com on 12/01/2020.
//  Copyright (c) 2020 jinfei_chen@icloud.com. All rights reserved.
//

#import "CJFViewController.h"

#import <CJFFormKit/CJFFormTableViewCell.h> 

#import <CJFFormKit/CJFFormLR002TableViewCell.h>
#import <CJFFormKit/CJFFormLRTag001TableViewCell.h>
#import <CJFFormKit/CJFFormFFGrid001TableViewCell.h>

#import <CJFFormKit/CJFFormTBSwitch001EditTableViewCell.h>

@interface CJFViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource; /**< <#property#> */
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
@end

@implementation CJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[CJFFormTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
    [self.tableView registerClass:[CJFFormLR002TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
    [self.tableView registerClass:[CJFFormLRTag001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
    [self.tableView registerClass:[CJFFormFFGrid001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormFFGrid001TableViewCell class])];
    
    [self.tableView registerClass:[CJFFormTBSwitch001EditTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBSwitch001EditTableViewCell class])];
    
    NSDictionary *exampleDict = @{
       kFormSectionHeader: @{},
       kFormSectionBody: @[
           @{
               kFormCellClass: @"CJFFormLR001TableViewCell",
               kFormCellTitle: @"MyTitle",
               kFormCellValue: @"MyValue"
           },
           @{
               kFormCellClass: @"CJFFormLR002TableViewCell",
               kFormCellTitle: @"MyTitle",
               kFormCellValue: @"MyValue"
           },
           @{
               kFormCellClass: @"CJFFormLRTag001TableViewCell",
               kFormCellTitle: @"MyTags",
               kFormCellValue: @[
                                   @"标签tag1",@"表面",@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                                   @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦",
                                   @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                                   @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦",
                                   @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                                   @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦"
                                ]
           },
           @{
               kFormCellClass: @"CJFFormFFGrid001TableViewCell",
               kFormCellTitle: @"MyTitle",
               kFormCellValue: @[
                                       @{
                                           @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
                                           @"value": @"lkhlkasdf11"
                                       },
                                       @{
                                           @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
                                           @"value": @"lkhlkasdf22"
                                       },
                                       @{
                                           @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
                                           @"value": @"lkhlkasdf33"
                                       },
                                       @{
                                           @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
                                           @"value": @"lkhlkasdf44"
                                       },
                                       @{
                                           @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
                                           @"value": @"lkhlkasdf55"
                                       }
                               ]
           },
           @{
               kFormCellClass: @"CJFFormTBSwitch001EditTableViewCell",
               kFormCellTitle: @"MyEditTitle",
               kFormCellValue: @"MyValue"
           }
       ],
       kFormSectionFooter: @{}
    };
    _dataSource = @[exampleDict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = self.dataSource[section];
    return [[dict valueForKey:kFormSectionBody] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
//    cell.textLabel.text = @"asdf";
    
//    if (indexPath.row == 0) {
//        CJFFormFFGrid001TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormFFGrid001TableViewCell class])];
//        [cell setModelWithDict:@{
//            @"dataSource" : @[
//                    @{
//                        @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
//                        @"value": @"lkhlkasdf11"
//                    },
//                    @{
//                        @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
//                        @"value": @"lkhlkasdf22"
//                    },
//                    @{
//                        @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
//                        @"value": @"lkhlkasdf33"
//                    },
//                    @{
//                        @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
//                        @"value": @"lkhlkasdf44"
//                    },
//                    @{
//                        @"imageUrl": @"https://common.cnblogs.com/images/icon_weibo_24.png",
//                        @"value": @"lkhlkasdf55"
//                    }
//            ]
//        } format:nil];
//        cell.cellStyle.contentInset = UIEdgeInsetsMake(8, 20, 8, 20);
//        return cell;
//    }
//
//    if (indexPath.row%2 == 0) {
//        CJFFormLRTag001TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
//        [cell setModelWithDict:@{
//            @"title": @"my tags:",
//            @"tags": @[
//                    @"标签tag1",@"表面",@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
//                    @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦",
//                    @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
//                    @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦",
//                    @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
//                    @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦"
//                    ]
//        } format:nil];
//        return cell;
//    } else {
//        CJFFormLR002TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
//        [cell setModelWithDict:@{
//            @"myTitle": @"my title:",
//            @"myValue": @"my value"
//        } format:@{
//            @"title": @"myTitle",
//            @"value": @"myValue"
//        }];
//        return cell;
//    }
    
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    CJFFormTableViewCell *cell = [CJFFormTableViewCell cellForTableView:tableView atIndexPath:indexPath dataSource:cellDict];
    [cell setModelWithDict:cellDict format:nil];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click at : %ld,%ld", indexPath.section, indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}

- (NSMutableDictionary *)heightAtIndexPath {
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

@end
