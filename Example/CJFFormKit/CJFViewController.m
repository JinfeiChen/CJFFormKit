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

#import <CJFFormKit/CJFFormTBSwitch001TableViewCell.h>
#import <CJFFormKit/CJFFormTBInputSearch001TableViewCell.h>
#import <CJFFormKit/CJFFormTBMultiSelect001TableViewCell.h>
#import <CJFFormKit/CJFFormTBUniSelect001TableViewCell.h>
#import <CJFFormKit/CJFFormTBTextField001TableViewCell.h>
#import <CJFFormKit/CJFFormTBDate001TableViewCell.h>
#import <CJFFormKit/CJFFormTBPhone001TableViewCell.h>
#import <CJFFormKit/CJFFormTBTextView001TableViewCell.h>
#import <CJFFormKit/CJFFormTBSlider001TableViewCell.h>
#import <CJFFormKit/CJFFormTBRange001TableViewCell.h>
#import <CJFFormKit/CJFFormTBNumber001TableViewCell.h>

@interface CJFViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *dataSource; /**< <#property#> */
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
@end

@implementation CJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Read
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
//    [self.tableView registerClass:[CJFFormTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
//    [self.tableView registerClass:[CJFFormLR002TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
//    [self.tableView registerClass:[CJFFormLRTag001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
//    [self.tableView registerClass:[CJFFormFFGrid001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormFFGrid001TableViewCell class])];
//    // Edit
//    [self.tableView registerClass:[CJFFormTBSwitch001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBSwitch001TableViewCell class])];
//    [self.tableView registerClass:[CJFFormTBInputSearch001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBInputSearch001TableViewCell class])];
//    [self.tableView registerClass:[CJFFormTBMultiSelect001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBMultiSelect001TableViewCell class])];
//    [self.tableView registerClass:[CJFFormTBUniSelect001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBUniSelect001TableViewCell class])];
//    [self.tableView registerClass:[CJFFormTBTextField001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBTextField001TableViewCell class])];
//    [self.tableView registerClass:[CJFFormTBDate001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBDate001TableViewCell class])];

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
                    @"标签tag1", @"表面", @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", @"测试测试", @"不不不不", @"无敌啊", @"标签", @"这样喊得好吗",@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"
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
                kFormCellClass: @"CJFFormTBSwitch001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @[
                    @{
                        @"state": @(0),
                        @"title": @"Female",
                        @"id": @(0)
                    },
                    @{
                        @"state": @(0),
                        @"title": @"Male",
                        @"id": @(1)
                    },
                    @{
                        @"state": @(0),
                        @"title": @"Both",
                        @"id": @(2)
                    }
                ]
            },
            @{
                kFormCellClass: @"CJFFormTBInputSearch001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"default text",
                kFormCellPlaceholder: @"placeholder"
            },
            @{
                kFormCellClass: @"CJFFormTBMultiSelect001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @[
                        @{
                            @"name": @"example01",
                            @"key": @"1",
                            @"value": @"1"
                        },
                        @{
                            @"name": @"example02",
                            @"key": @"2",
                            @"value": @"2"
                        },
                        @{
                            @"name": @"example03",
                            @"key": @"3",
                            @"value": @"3"
                        },
                        @{
                            @"name": @"example04",
                            @"key": @"4",
                            @"value": @"4"
                        },
                        @{
                            @"name": @"example05",
                            @"key": @"5",
                            @"value": @"5"
                        },
                        @{
                            @"name": @"example06",
                            @"key": @"6",
                            @"value": @"6"
                        }
                ],
                kFormCellPlaceholder: @"placeholder"
            },
            @{
                kFormCellClass: @"CJFFormTBUniSelect001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"default text",
                kFormCellPlaceholder: @"placeholder",
            },
            @{
                kFormCellClass: @"CJFFormTBTextField001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"default text",
                kFormCellPlaceholder: @"placeholder",
            },
            @{
                kFormCellClass: @"CJFFormTBDate001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"default text",
                kFormCellPlaceholder: @"placeholder",
            },
            @{
                kFormCellClass: @"CJFFormTBPhone001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"default text",
                kFormCellPlaceholder: @"placeholder",
                @"countryCode": @"+86",
                @"countryArea": @"China"
            },
            @{
                kFormCellClass: @"CJFFormTBTextView001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"default text",
                kFormCellPlaceholder: @"placeholder",
            },
            @{
                kFormCellClass: @"CJFFormTBSlider001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"8",
                @"minValue": @(0),
                @"maxValue": @(10)
            },
            @{
                kFormCellClass: @"CJFFormTBRange001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"",
                @"minValue": @(0),
                @"maxValue": @(10)
            },
            @{
                kFormCellClass: @"CJFFormTBNumber001TableViewCell",
                kFormCellTitle: @"MyEditTitle",
                kFormCellValue: @"0"
            }
        ],
        kFormSectionFooter: @{}
    };
    _dataSource = @[exampleDict];
    
    // Regist Cells
    NSArray *bodyArray = exampleDict[kFormSectionBody];
    [bodyArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *classStr = obj[kFormCellClass];
        [self.tableView registerClass:NSClassFromString(classStr) forCellReuseIdentifier:classStr];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

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
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    CJFFormTableViewCell *cell = [CJFFormTableViewCell cellForTableView:tableView atIndexPath:indexPath dataSource:cellDict];
    [cell setModelWithDict:cellDict format:nil];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    NSLog(@"click at indexPath: %@, data: %@, selected: %d", indexPath, cellDict, [tableView cellForRowAtIndexPath:indexPath].selected);
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
//    if (height) {
//        return height.floatValue;
//    } else {
//        return UITableViewAutomaticDimension;
//    }
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSNumber *height = @(cell.frame.size.height);
//    [self.heightAtIndexPath setObject:height forKey:indexPath];
//}

#pragma mark - Getters

- (NSMutableDictionary *)heightAtIndexPath {
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

@end
