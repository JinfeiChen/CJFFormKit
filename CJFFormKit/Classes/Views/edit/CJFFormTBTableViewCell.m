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
    self.contentView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
}

#pragma mark - Getters

- (UILabel *)TTitleLabel
{
    if (!_TTitleLabel) {
        _TTitleLabel = [[UILabel alloc] init];
        _TTitleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _TTitleLabel.textColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    }
    return _TTitleLabel;
}

@end
