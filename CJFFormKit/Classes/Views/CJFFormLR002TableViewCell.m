//
//  CJFFormLR002TableViewCell.m
//  Pods
//
//  Created by cjf on 1/12/2020.
//

#import "CJFFormLR002TableViewCell.h"

@implementation CJFFormLR002Model

@end

@implementation CJFFormLR002TableViewCell

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
    [self.contentView addSubview:self.RValueLabel];
    
    [self.LTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.height.mas_equalTo(18);
    }];

    [self.RValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.top);
        make.right.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.bottom.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
        make.left.mas_equalTo(self.LTitleLabel.mas_right).offset(10);
        make.height.greaterThanOrEqualTo(@16);
    }];
    [self.RValueLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
}

#pragma mark - Private Methods

#pragma mark - Public Methods

- (void)setModelWithDict:(NSDictionary *)dict format:(NSDictionary *)format
{
    if (!dict) {
        return;
    }
    
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if (format) {
        [format.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *key = [format objectForKey:obj];
            id value = [dict objectForKey:key];
            if (value) {
                [mDict setObject:value forKey:obj];
            }
        }];
    }
    self.model = [CJFFormLR002Model yy_modelWithJSON:mDict];
    self.LTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    self.RValueLabel.text = [NSString stringWithFormat:@"%@", self.model.value];
}

#pragma mark - Setters

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

- (UILabel *)RValueLabel
{
    if (!_RValueLabel) {
        _RValueLabel = [[UILabel alloc] init];
        _RValueLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _RValueLabel.textColor = [UIColor colorWithRed:19 / 255.0 green:16 / 255.0 blue:50 / 255.0 alpha:1.0];
        _RValueLabel.numberOfLines = 0;
    }
    return _RValueLabel;
}

@end
