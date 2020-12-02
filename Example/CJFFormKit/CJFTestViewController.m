//
//  CJFTestViewController.m
//  CJFFormKit_Example
//
//  Created by cjf on 1/12/2020.
//  Copyright © 2020 jinfei_chen@icloud.com. All rights reserved.
//

#import "CJFTestViewController.h"
#import <CJFFormKit/CJFFormLR002TableViewCell.h>

@interface CJFTestViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CJFTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CJFFormReadLR001TableViewCell *cell = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormLR002TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    [cell setModelWithDict:@{
        @"title": @"my title",
        @"value": @"my valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy value"
    } format:nil];
    return cell;
}

@end
