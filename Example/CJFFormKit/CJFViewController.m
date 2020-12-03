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
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
@end

@implementation CJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[CJFFormLR002TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
    [self.tableView registerClass:[CJFFormLRTag001TableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
    
//    int64_t delayInSeconds = 2.0; /**< 延迟的时间 */
//    /*
//     @parameter 1,时间参照，从此刻开始计时
//     @parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
//     */
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // do something
//        [self.tableView reloadData];
//    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
//    cell.textLabel.text = @"asdf";
    if (indexPath.row%2 == 0) {
        CJFFormLRTag001TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLRTag001TableViewCell class])];
        [cell setModelWithDict:@{
            @"title": @"my tags:",
            @"tags": @[
                    @"标签tag1",@"表面",@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                    @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦",
                    @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                    @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦",
                    @"标签tag1",@"表面",@"哈哈哈",@"测试测试",@"不不不不",@"无敌啊",@"标签",@"这样喊得好吗",
                    @"哈哈哈",@"嘻嘻嘻",@"呵呵呵",@"标签",@"表面兄弟",@"你好啊",@"不想你了哦",@"不要这样子啦"
                    ]
        } format:nil];
        return cell;
    } else {
        CJFFormLR002TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormLR002TableViewCell class])];
        [cell setModelWithDict:@{
            @"myTitle": @"my title:",
            @"myValue": @"my value"
        } format:@{
            @"title": @"myTitle",
            @"value": @"myValue"
        }];
        return cell;
    }
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
