//
//  CJFFormTBTableViewCell.m
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#import "CJFFormTBTableViewCell.h"

@implementation CJFFormTBTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildView];
    }
    return self;
}

#pragma mark - View

- (void)buildView
{
    self.contentView.backgroundColor = self.cellStyle.backgroundColor;
}

#pragma mark - Getters

- (UILabel *)requiredLabel
{
    if (!_requiredLabel) {
        _requiredLabel = [[UILabel alloc] init];
        _requiredLabel.font = [UIFont systemFontOfSize:16];
        _requiredLabel.textColor = [UIColor redColor];
        _requiredLabel.text = @"*";
    }
    return _requiredLabel;
}

- (UILabel *)TTitleLabel
{
    if (!_TTitleLabel) {
        _TTitleLabel = [[UILabel alloc] init];
        _TTitleLabel.font = self.cellStyle.titleFont;
        _TTitleLabel.textColor = self.cellStyle.titleColor;
    }
    return _TTitleLabel;
}

@end
