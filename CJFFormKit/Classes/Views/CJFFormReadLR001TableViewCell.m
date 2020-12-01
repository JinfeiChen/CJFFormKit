//
//  CJFFormReadLR001TableViewCell.m
//  CJFFormKit
//
//  Created by cjf on 1/12/2020.
//

#import "CJFFormReadLR001TableViewCell.h"

@implementation CJFFormReadLR001TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buildView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - View

- (void)buildView
{
    [self.contentView addSubview:self.LTitleLabel];
    [self.LTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.style.contentInset.left);
        make.height.mas_equalTo(16);
    }];
    
    [self.contentView addSubview:self.RValueLabel];
    [self.RValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.right.mas_equalTo(self.contentView).offset(-self.style.contentInset.right);
        make.bottom.mas_equalTo(self.contentView).offset(-self.style.contentInset.bottom);
        make.left.mas_offset(self.LTitleLabel).offset(10);
    }];
}

#pragma mark - Private Methods

#pragma mark - Getters

- (UILabel *)LTitleLabel
{
    if (!_LTitleLabel) {
        _LTitleLabel = [[UILabel alloc] init];
        _LTitleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _LTitleLabel.textColor = [UIColor colorWithRed:159/255.0 green:162/255.0 blue:168/255.0 alpha:1.0];
    }
    return _LTitleLabel;
}

- (UILabel *)RValueLabel
{
    if (!_RValueLabel) {
        _RValueLabel = [[UILabel alloc] init];
        _RValueLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _RValueLabel.textColor = [UIColor colorWithRed:19/255.0 green:16/255.0 blue:50/255.0 alpha:1.0];
    }
    return _RValueLabel;
}

@end
