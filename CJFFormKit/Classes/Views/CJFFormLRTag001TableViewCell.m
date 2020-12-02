//
//  CJFFormLRTag001TableViewCell.m
//  Pods
//
//  Created by cjf on 2/12/2020.
//

#import "CJFFormLRTag001TableViewCell.h"

@interface CJFFormLRTag001TableViewCell ()

@property (strong, nonatomic) UIView *tagContainerView; /**< <#property#> */

@end

@implementation CJFFormLRTag001TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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
    [self.contentView addSubview:self.LTitleLabel];
    [self.LTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.style.contentInset.left);
        make.height.mas_equalTo(18);
    }];
}

#pragma mark - Getters

- (UILabel *)LTitleLabel
{
    if (!_LTitleLabel) {
        _LTitleLabel = [[UILabel alloc] init];
        _LTitleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _LTitleLabel.textColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    }
    return _LTitleLabel;
}

@end
