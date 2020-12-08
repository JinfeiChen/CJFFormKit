//
//  CJFFormTableViewCell.m
//  CJFFormKit
//
//  Created by cjf on 8/12/2020.
//

#import "CJFFormTableViewCell.h"

@implementation CJFFormTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CJFFormTableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath dataSource:(NSDictionary *)dataSource
{
    NSLog(@"dataSource: %@", dataSource);
    
    NSString *cellClassStr = [dataSource objectForKey:kFormCellClass];
    id cell = [tableView dequeueReusableCellWithIdentifier:cellClassStr];
    if (cell) {
        return cell;
    }
    
    NSLog(@"return default cell");
    CJFFormTableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
    if (!defaultCell) {
        defaultCell = [[CJFFormTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
        defaultCell.textLabel.text = @"Default";
    }
    return defaultCell;
}

#pragma mark - Public Methods

- (void)setModelWithDict:(NSDictionary *)dict format:(NSDictionary *)format
{
}

#pragma mark - Setters

#pragma mark - Getters

- (CJFFormTableViewCellStyle *)cellStyle
{
    if (!_cellStyle) {
        _cellStyle = [[CJFFormTableViewCellStyle alloc] init];
        _cellStyle.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _cellStyle;
}

@end

@implementation CJFFormTableViewCellStyle

@end
