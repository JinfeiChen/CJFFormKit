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

#pragma mark - Public Methods

+ (CJFFormTableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath dataSource:(NSDictionary *)dataSource
{
//    NSLog(@"dataSource: %@", dataSource);
    
    NSString *cellClassStr = [dataSource objectForKey:kFormItemClassKey];
    id cell = [tableView dequeueReusableCellWithIdentifier:cellClassStr];
    if (cell) {
        [cell setValue:indexPath forKey:@"indexPath"];
        [cell setValue:tableView forKey:@"tableView"];
        return cell;
    }
    
//    NSLog(@"return default cell");
    CJFFormTableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
    if (!defaultCell) {
        defaultCell = [[CJFFormTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
        defaultCell.textLabel.text = @"Default";
        [cell setValue:indexPath forKey:@"indexPath"];
        [cell setValue:tableView forKey:@"tableView"];
    }
    return defaultCell;
}

- (void)setModelWithDict:(NSDictionary *)dict format:(NSDictionary *)format
{
    
}

#pragma mark - Setters

#pragma mark - Getters

- (CJFFormTableViewCellStyle *)cellStyle
{
    if (!_cellStyle) {
        _cellStyle = [CJFFormTableViewCellStyle defaultCellStyle];
    }
    return _cellStyle;
}

@end

@implementation CJFFormTableViewCellStyle

+ (instancetype)defaultCellStyle
{
    CJFFormTableViewCellStyle *style = [[CJFFormTableViewCellStyle alloc] init];
    style.contentInset = UIEdgeInsetsMake(10, 12, 12, 12);
    style.titleColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    style.titleFont = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    style.valueColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    style.valueFont = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    style.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1.0];
    style.placeholderColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    style.spacing = 10.0;
    return style;
}

@end
