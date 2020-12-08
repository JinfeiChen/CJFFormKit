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

+ (CJFFormTableViewCell *)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    CJFFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
    if (!cell) {
        cell = [[CJFFormTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CJFFormTableViewCell class])];
    }
    return cell;
}

@end
