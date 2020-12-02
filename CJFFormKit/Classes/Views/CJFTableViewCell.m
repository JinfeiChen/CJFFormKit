//
//  CJFTableViewCell.m
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import "CJFTableViewCell.h"

@implementation CJFTableViewCellStyle

@end

@implementation CJFTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public Methods

- (void)setModelWithDict:(NSDictionary *)dict format:(NSDictionary *)format
{
}

#pragma mark - Setters

#pragma mark - Getters

- (CJFTableViewCellStyle *)style
{
    if (!_style) {
        _style = [[CJFTableViewCellStyle alloc] init];
        _style.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _style;
}

@end
