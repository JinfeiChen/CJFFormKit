//
//  CJFFormLRTag001TableViewCell.m
//  Pods
//
//  Created by cjf on 2/12/2020.
//

#import "CJFFormLRTag001TableViewCell.h"

@implementation CJFFormLRTag001Model

@end


@implementation CJFFormLRTag001TagStyle

@end


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
    
    [self.contentView addSubview:self.tagContainerView];
    [self.tagContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.right.mas_equalTo(self.contentView).offset(-self.style.contentInset.right);
        make.bottom.mas_equalTo(self.contentView).offset(-self.style.contentInset.bottom);
        make.left.mas_equalTo(self.LTitleLabel.mas_right).offset(10);
        make.height.greaterThanOrEqualTo(@16);
    }];
}

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
    self.model = [CJFFormLRTag001Model yy_modelWithJSON:mDict];
    self.LTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
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

- (UIView *)tagContainerView
{
    if (!_tagContainerView) {
        _tagContainerView = [[UIView alloc] init];
        _tagContainerView.backgroundColor = [UIColor yellowColor]; // temp
    }
    return _tagContainerView;
}

@end
