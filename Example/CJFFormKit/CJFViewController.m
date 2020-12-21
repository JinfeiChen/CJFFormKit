//
//  CJFViewController.m
//  CJFFormKit
//
//  Created by jinfei_chen@icloud.com on 12/01/2020.
//  Copyright (c) 2020 jinfei_chen@icloud.com. All rights reserved.
//

#import "CJFViewController.h"

#import <YYModel/YYModel.h>

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
#import <CJFFormKit/CJFFormTBImageUpload001TableViewCell.h>
#import <CJFFormKit/CJFFormTBNested001TableViewCell.h>

@interface CJFViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *dataSource; /**< <#property#> */
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
@end

@implementation CJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

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
                kFormItemClassKey: @"CJFFormLR001TableViewCell",
                kFormItemTitleKey: @"MyTitle",
                kFormItemValueKey: @"MyValue"
            },
            @{
                kFormItemClassKey: @"CJFFormLR002TableViewCell",
                kFormItemTitleKey: @"MyTitle",
                kFormItemValueKey: @"MyValue"
            },
            @{
                kFormItemClassKey: @"CJFFormLRTag001TableViewCell",
                kFormItemTitleKey: @"MyTags",
                kFormItemValueKey: @[
                    @"标签tag1", @"表面", @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", @"测试测试", @"不不不不", @"无敌啊", @"标签", @"这样喊得好吗",@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"@"无敌啊", @"标签", @"这样喊得好吗"
                ]
            },
            @{
                kFormItemClassKey: @"CJFFormFFGrid001TableViewCell",
                kFormItemTitleKey: @"MyTitle",
                kFormItemValueKey: @[
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
                kFormItemClassKey: @"CJFFormTBNested001TableViewCell",
                kFormItemTitleKey: @"Nested001",
                kFormItemValueKey: @[
                        @{
                            @"prefixText": @"N/Aaaaaaaa",
                            @"text": @"",
                            @"placeholder": @"Please input"
                        },
                        @{
                            @"prefixText": @"N/Abbbbb",
                            @"text": @"",
                            @"placeholder": @"Please input"
                        },
                        @{
                            @"prefixText": @"N/Acccc",
                            @"text": @"",
                            @"placeholder": @"Please input"
                        },
                        @{
                            @"prefixText": @"N/Addd",
                            @"text": @"",
                            @"placeholder": @"Please input"
                        },
                        @{
                            @"prefixText": @"N/Aeeeeeeeeee",
                            @"text": @"",
                            @"placeholder": @"Please input"
                        }
                ],
                kFormItemRequiredKey: @(YES),
                kFormItemSelectorKey: @"testFormTBNestedCell:model:indexPath:reserve:",
                kFormItemCustomSelectorKey: @"customFormTBNestedCell:model:indexPath:reserve:",
                @"addButtonTitle": @"Add New SubCell",
                @"prefixArray": @[
                        @"Default",
                        @"aaaaaaaa",
                        @"bbbbbbbbbbbbbbbbbbbbb"
                ]
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBFileUpload001TableViewCell",
                kFormItemTitleKey: @"FileUpload001",
                kFormItemValueKey: @[
                    @"file name 01",
                    @"file name 02",
                    @"file name 03"
                ],
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBFileUploadCell:model:indexPath:reserve:",
                kFormItemCustomSelectorKey: @"customFormTBFileUploadCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBSwitch001TableViewCell",
                kFormItemTitleKey: @"Switch001",
                kFormItemValueKey: @[
                    @{
                        @"selected": @(YES),
                        @"title": @"Female",
                        @"id": @(0)
                    },
                    @{
                        @"selected": @(NO),
                        @"title": @"Male",
                        @"id": @(1)
                    },
                    @{
                        @"selected": @(NO),
                        @"title": @"Both",
                        @"id": @(2)
                    }
                ],
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBSwitchCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBInputSearch001TableViewCell",
                kFormItemTitleKey: @"InputSearch001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBInputSearchCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBInputSearch001TableViewCell",
                kFormItemTitleKey: @"InputSearch001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBInputSearchCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBMultiSelect001TableViewCell",
                kFormItemTitleKey: @"MultiSelect001",
                kFormItemValueKey: @[
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
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBMultSelectCell:model:indexPath:reserve:",
                kFormItemCustomSelectorKey: @"customFormTBMultSelectCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBMultiSelect001TableViewCell",
                kFormItemTitleKey: @"MultiSelect001",
                kFormItemValueKey: @[
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
                        }
                ],
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBMultSelectCell:model:indexPath:reserve:",
                kFormItemCustomSelectorKey: @"customFormTBMultSelectCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBUniSelect001TableViewCell",
                kFormItemTitleKey: @"UniSelect001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBUniSelectCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBUniSelect001TableViewCell",
                kFormItemTitleKey: @"UniSelect001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBUniSelectCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBTextField001TableViewCell",
                kFormItemTitleKey: @"TextField001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBTextFieldCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBTextField001TableViewCell",
                kFormItemTitleKey: @"TextField001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBTextFieldCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBDate001TableViewCell",
                kFormItemTitleKey: @"Date001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemCustomSelectorKey: @"customFormTBDateCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBDate001TableViewCell",
                kFormItemTitleKey: @"Date001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemCustomSelectorKey: @"customFormTBDateCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBPhone001TableViewCell",
                kFormItemTitleKey: @"Phone001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                @"countryCode": @"+86",
                @"countryArea": @"China",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBPhoneCell:model:indexPath:reserve:",
                kFormItemCustomSelectorKey: @"customFormTBPhoneCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBPhone001TableViewCell",
                kFormItemTitleKey: @"Phone001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                @"countryCode": @"+86",
                @"countryArea": @"China",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBPhoneCell:model:indexPath:reserve:",
                kFormItemCustomSelectorKey: @"customFormTBPhoneCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBTextView001TableViewCell",
                kFormItemTitleKey: @"TextView001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBTextViewCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBTextView001TableViewCell",
                kFormItemTitleKey: @"TextView001",
                kFormItemValueKey: @"default text",
                kFormItemPlaceholderKey: @"placeholder",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBTextViewCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBSlider001TableViewCell",
                kFormItemTitleKey: @"Slider001",
                kFormItemValueKey: @"8",
                @"minValue": @(0),
                @"maxValue": @(10),
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBSliderCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBSlider001TableViewCell",
                kFormItemTitleKey: @"Slider001",
                kFormItemValueKey: @"5",
                @"minValue": @(0),
                @"maxValue": @(10),
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBSliderCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBRange001TableViewCell",
                kFormItemTitleKey: @"Range001",
                kFormItemValueKey: @"",
                @"minValue": @(0),
                @"maxValue": @(10),
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBRangeCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBRange001TableViewCell",
                kFormItemTitleKey: @"Range001",
                kFormItemValueKey: @"",
                @"minValue": @(0),
                @"maxValue": @(10),
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBRangeCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBNumber001TableViewCell",
                kFormItemTitleKey: @"Number001",
                kFormItemValueKey: @"0",
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBNumberCell:model:indexPath:reserve:"
            },
            @{
                kFormItemClassKey: @"CJFFormTBNumber001TableViewCell",
                kFormItemTitleKey: @"Number001",
                kFormItemValueKey: @"22",
                kFormItemRequiredKey: @(NO),
                kFormItemEditableKey: @(NO),
                kFormItemSelectorKey: @"testFormTBNumberCell:model:indexPath:reserve:"
            },
            
            @{
                kFormItemClassKey: @"CJFFormTBImageUpload001TableViewCell",
                kFormItemTitleKey: @"ImageUpload001",
                kFormItemValueKey: @[
                        @"https://cdn.pixabay.com/photo/2020/11/12/15/45/dog-5735837__480.jpg",
                        @"https://cdn.pixabay.com/photo/2020/11/26/11/48/cat-5778777__480.jpg"
                ],
                kFormItemRequiredKey: @(YES),
                kFormItemEditableKey: @(YES),
                kFormItemSelectorKey: @"testFormTBImageUploadCell:model:indexPath:reserve:"
            }
        ],
        kFormSectionFooter: @{}
    };
    _dataSource = @[exampleDict];
    
    // Regist Cells
    NSArray *bodyArray = exampleDict[kFormSectionBody];
    [bodyArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *classStr = obj[kFormItemClassKey];
        [self.tableView registerClass:NSClassFromString(classStr) forCellReuseIdentifier:classStr];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Cell's Event

- (void)testFormTBNestedCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
    
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    
    NSMutableDictionary *mCellDict = [NSMutableDictionary dictionaryWithDictionary:cellDict];
    [mCellDict setValue:[model.value yy_modelToJSONObject] forKey:kFormItemValueKey];
    
    NSMutableArray *mBodyArray = [NSMutableArray arrayWithArray:bodyArray];
    [mBodyArray replaceObjectAtIndex:indexPath.row withObject:mCellDict];
    NSMutableDictionary *mBodyDict = [NSMutableDictionary dictionaryWithDictionary:bodyDict];
    [mBodyDict setObject:mBodyArray forKey:kFormSectionBody];
    NSMutableArray *mDataSource = [NSMutableArray arrayWithArray:self.dataSource];
    [mDataSource replaceObjectAtIndex:indexPath.section withObject:mBodyDict];
    self.dataSource = mDataSource;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone]; 
}

- (void)customFormTBNestedCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
    
    NSIndexPath *subIndexPath = (NSIndexPath *)reserveObj;
    if (!subIndexPath) {
        return;
    }
    [model.value enumerateObjectsUsingBlock:^(CJFFormTBNested001SubModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"model: %@, selected status: %ld", [model yy_modelToJSONObject], (long)obj.selected);
        
        NSDictionary *bodyDict = self.dataSource[indexPath.section];
        NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
        NSDictionary *cellDict = bodyArray[indexPath.row];
        
        NSMutableArray *mArr = [NSMutableArray arrayWithArray:cellDict[kFormItemValueKey]];
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:mArr[idx]];
        
        // update prefixText
        if (subIndexPath.row == idx) {
            NSLog(@"%@", obj.prefixText);
            [mDict setValue:@"updated" forKey:@"prefixText"];
        }
        
        // update selected status
        [mDict setValue:@(obj.selected) forKey:@"selected"];
        [mArr replaceObjectAtIndex:idx withObject:mDict];
        NSMutableDictionary *mCellDict = [NSMutableDictionary dictionaryWithDictionary:cellDict];
        [mCellDict setValue:mArr forKey:kFormItemValueKey];
        
        NSMutableArray *mBodyArray = [NSMutableArray arrayWithArray:bodyArray];
        [mBodyArray replaceObjectAtIndex:indexPath.row withObject:mCellDict];
        NSMutableDictionary *mBodyDict = [NSMutableDictionary dictionaryWithDictionary:bodyDict];
        [mBodyDict setObject:mBodyArray forKey:kFormSectionBody];
        NSMutableArray *mDataSource = [NSMutableArray arrayWithArray:self.dataSource];
        [mDataSource replaceObjectAtIndex:indexPath.section withObject:mBodyDict];
        self.dataSource = mDataSource;
    }];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)testFormTBFileUploadCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)customFormTBFileUploadCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
    
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    // update
    NSMutableDictionary *mCellDict = [NSMutableDictionary dictionaryWithDictionary:cellDict];
    [mCellDict setValue:[model.value yy_modelToJSONObject] forKey:kFormItemValueKey];
    // add
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:[model.value yy_modelToJSONObject]];
    [mArr addObject:@"Example file name"];
    [mCellDict setValue:mArr forKey:kFormItemValueKey];
    
    NSMutableArray *mBodyArray = [NSMutableArray arrayWithArray:bodyArray];
    [mBodyArray replaceObjectAtIndex:indexPath.row withObject:mCellDict];
    NSMutableDictionary *mBodyDict = [NSMutableDictionary dictionaryWithDictionary:bodyDict];
    [mBodyDict setObject:mBodyArray forKey:kFormSectionBody];
    NSMutableArray *mDataSource = [NSMutableArray arrayWithArray:self.dataSource];
    [mDataSource replaceObjectAtIndex:indexPath.section withObject:mBodyDict];
    self.dataSource = mDataSource;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)testFormTBSwitchCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
    
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    
    // update
    NSMutableDictionary *mCellDict = [NSMutableDictionary dictionaryWithDictionary:cellDict];
    [mCellDict setValue:[model.value yy_modelToJSONObject] forKey:kFormItemValueKey];
    
    NSMutableArray *mBodyArray = [NSMutableArray arrayWithArray:bodyArray];
    [mBodyArray replaceObjectAtIndex:indexPath.row withObject:mCellDict];
    NSMutableDictionary *mBodyDict = [NSMutableDictionary dictionaryWithDictionary:bodyDict];
    [mBodyDict setObject:mBodyArray forKey:kFormSectionBody];
    NSMutableArray *mDataSource = [NSMutableArray arrayWithArray:self.dataSource];
    [mDataSource replaceObjectAtIndex:indexPath.section withObject:mBodyDict];
    self.dataSource = mDataSource;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)testFormTBInputSearchCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, model.value, indexPath, reserveObj);
    
    NSDictionary *bodyDict = self.dataSource[indexPath.section];
    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
    NSDictionary *cellDict = bodyArray[indexPath.row];
    
    NSMutableDictionary *mCellDict = [NSMutableDictionary dictionaryWithDictionary:cellDict];
    [mCellDict setValue:@"update from outside" forKey:kFormItemValueKey];
    
    NSMutableArray *mBodyArray = [NSMutableArray arrayWithArray:bodyArray];
    [mBodyArray replaceObjectAtIndex:indexPath.row withObject:mCellDict];
    NSMutableDictionary *mBodyDict = [NSMutableDictionary dictionaryWithDictionary:bodyDict];
    [mBodyDict setObject:mBodyArray forKey:kFormSectionBody];
    NSMutableArray *mDataSource = [NSMutableArray arrayWithArray:self.dataSource];
    [mDataSource replaceObjectAtIndex:indexPath.section withObject:mBodyDict];
    self.dataSource = mDataSource;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)testFormTBMultSelectCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)customFormTBMultSelectCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBUniSelectCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBTextFieldCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)customFormTBDateCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBPhoneCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)customFormTBPhoneCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBTextViewCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBSliderCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBRangeCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
}

- (void)testFormTBNumberCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, model.value, indexPath, reserveObj);
}

- (void)testFormTBImageUploadCell:(CJFFormTableViewCell *)cell model:(CJFFormModel *)model indexPath:(NSIndexPath *)indexPath reserve:(id)reserveObj
{
    NSLog(@"%s, %@, %@, %@, %@", __FUNCTION__, cell, [model.value yy_modelToJSONObject], indexPath, reserveObj);
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
    // custom selector
    [cell performSelector:@selector(setCustomDidSelectedBlock:) withObject:^(CJFFormTableViewCell *cell, CJFFormModel *model, id reservedObj) {
        SEL selector = NSSelectorFromString(cellDict[kFormItemCustomSelectorKey]);
        if ([self respondsToSelector:selector]) {
           IMP imp = [self methodForSelector:selector];
           void (*func)(id, SEL, id, id, id, id) = (void *)imp;
           func(self, selector, cell, model, indexPath, reservedObj);
        }
    }];
    // default selector
    if ([cell respondsToSelector:@selector(setDidUpdateFormModelBlock:)]) {
        [cell performSelector:@selector(setDidUpdateFormModelBlock:) withObject:^(CJFFormTableViewCell *cell, CJFFormModel *model, id reservedObj) {
            SEL selector = NSSelectorFromString(cellDict[kFormItemSelectorKey]);
            if ([self respondsToSelector:selector]) {
               IMP imp = [self methodForSelector:selector];
               void (*func)(id, SEL, id, id, id, id) = (void *)imp;
               func(self, selector, cell, model, indexPath, reservedObj);
            }
        }];
    }
    
    // validate imp
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSDictionary *bodyDict = self.dataSource[indexPath.section];
//    NSArray *bodyArray = [bodyDict objectForKey:kFormSectionBody];
//    NSDictionary *cellDict = bodyArray[indexPath.row];
//    NSLog(@"click at indexPath: %@, data: %@, selected: %d", indexPath, cellDict, [tableView cellForRowAtIndexPath:indexPath].selected);
//}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if (height) {
        return height.floatValue;
    } else {
        return UITableViewAutomaticDimension;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}

#pragma mark - Getters

- (NSMutableDictionary *)heightAtIndexPath {
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

@end
