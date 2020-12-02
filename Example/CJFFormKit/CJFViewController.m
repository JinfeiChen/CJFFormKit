//
//  CJFViewController.m
//  CJFFormKit
//
//  Created by jinfei_chen@icloud.com on 12/01/2020.
//  Copyright (c) 2020 jinfei_chen@icloud.com. All rights reserved.
//

#import "CJFViewController.h"

#import <CJFFormKit/CJFFormLR002TableViewCell.h>
#import <CJFFormKit/CJFFormLRTag001TableViewCell.h>

@interface CJFViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[CJFFormLR002TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
    [self.tableView registerClass:[CJFFormLRTag001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
//    cell.textLabel.text = @"asdf";
    if (indexPath.row%2 == 0) {
        CJFFormLRTag001TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
        [cell setModelWithDict:@{
            @"title": @"my tags:",
            @"tags": @[@"Air-Conditioning", @"Features", @"Features10"]
        } format:nil];
        return cell;
    } else {
        CJFFormLR002TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
        [cell setModelWithDict:@{
            @"myTitle": @"my title",
            @"myValue": @"my value"
        } format:@{
            @"title": @"myTitle",
            @"value": @"myValue"
        }];
        return cell;
    }
}

@end
