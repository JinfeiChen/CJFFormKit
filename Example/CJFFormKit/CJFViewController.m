//
//  CJFViewController.m
//  CJFFormKit
//
//  Created by jinfei_chen@icloud.com on 12/01/2020.
//  Copyright (c) 2020 jinfei_chen@icloud.com. All rights reserved.
//

#import "CJFViewController.h"

#import <CJFFormKit/CJFView.h>
#import <CJFFormKit/CJFTableViewCell.h>
#import <CJFFormLR002TableViewCell.h>

@interface CJFViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[CJFFormLR002TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
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
    CJFFormLR002TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
    [cell setModelWithDict:@{
        @"title": @"my title",
        @"value": @"my valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy valuemy value"
    } format:nil];
    return cell;
}

@end
