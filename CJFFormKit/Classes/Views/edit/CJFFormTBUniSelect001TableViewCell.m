//
//  CJFFormTBUniSelect001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBUniSelect001TableViewCell.h"

@implementation CJFFormTBUniSelect001Model



@end

@interface CJFFormTBUniSelect001TableViewCell ()

@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *placeHoldLabel;

@end

@implementation CJFFormTBUniSelect001TableViewCell

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
    self.contentView.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1.0];
    
    [self.contentView addSubview:self.TTitleLabel];
    [self.TTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.height.mas_equalTo(18);
    }];
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
    }];
    
    [self.bgView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.right.equalTo(self.bgView);
        make.height.equalTo(self.bgView);
        make.width.mas_equalTo(40);
    }];
    
    [self.bgView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView);
        make.left.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.rightButton.mas_left);
        make.bottom.equalTo(self.bgView);
    }];
    
    [self.bgView addSubview:self.placeHoldLabel];
    [self.placeHoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentLabel);
    }];
}

- (void)setModelWithDict:(NSDictionary *)dict format:(NSDictionary *)format
{
    if (!dict) {
        return;
    }

    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if (format) {
        [format.allKeys enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            NSString *key = [format objectForKey:obj];
            id value = [dict objectForKey:key];
            if (value) {
                [mDict setObject:value forKey:obj];
            }
        }];
    }
    self.model = [CJFFormTBUniSelect001Model yy_modelWithJSON:mDict];
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    if (self.model.value && [self.model.value length] > 0) {
        self.placeHoldLabel.hidden = YES;
    }else {
        self.placeHoldLabel.hidden = NO;
    }
    self.contentLabel.text = self.model.value;
    self.placeHoldLabel.text = self.model.placeholder ? : @"Please Select";
    
    [UIView animateWithDuration:0.3 animations:^{
        if (self.model.isSelected) {
            self.rightButton.transform = CGAffineTransformMakeRotation(M_PI_2);
        }else {
            self.rightButton.transform = CGAffineTransformIdentity;
        }
    }];

    self.rightButton.hidden = (self.model.privilege == CJFFormPrivilege_Read);
}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius  = 8;
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = kCJFFormHexColor(0x565465);
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UILabel *)placeHoldLabel {
    if (_placeHoldLabel == nil) {
        _placeHoldLabel = [[UILabel alloc] init];
        _placeHoldLabel.font = [UIFont systemFontOfSize:14];
        _placeHoldLabel.textColor = kCJFFormHexColor(0xC4C7D1);
    }
    return _placeHoldLabel;
}

- (UIButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.userInteractionEnabled = NO;
        [_rightButton setImage:[UIImage imageNamed:@"search_next" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _contentLabel.textColor = kCJFFormHexColor(0x565465);
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _rightButton;
}

@end
