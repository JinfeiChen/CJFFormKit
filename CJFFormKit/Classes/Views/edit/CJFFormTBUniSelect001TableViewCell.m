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

@dynamic model;

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
    
    [self.contentView addSubview:self.TTitleLabel];
    [self.TTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.height.mas_equalTo(18);
    }];
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.left.equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
        make.height.mas_equalTo(40);
    }];
    
    [self.bgView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.right.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
        make.width.equalTo(@40);
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
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
    
    if (self.model.value && [self.model.value length] > 0) {
        self.placeHoldLabel.hidden = YES;
    }else {
        self.placeHoldLabel.hidden = NO;
    }
    self.contentLabel.text = self.model.value;
    self.placeHoldLabel.text = self.model.placeholder ? : @"Please Select";
    
    if (self.model.isEditable) {
        self.rightButton.hidden = NO;
    } else {
        self.rightButton.hidden = YES;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        if (self.model.isSelected) {
            self.rightButton.transform = CGAffineTransformMakeRotation(M_PI_2);
        }else {
            self.rightButton.transform = CGAffineTransformIdentity;
        }
    }];
    
    self.bgView.userInteractionEnabled = self.model.isEditable;
    self.bgView.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
}

#pragma mark - Actions

- (void)clickAction:(id)sender
{
    if (self.customDidSelectedBlock) {
        self.customDidSelectedBlock(self, self.model, nil);
    }
}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius  = 8;
        _bgView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
        [_bgView addGestureRecognizer:tap];
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
        [_rightButton setImage:[UIImage imageNamed:@"search_next" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _rightButton.userInteractionEnabled = NO;
//        [_rightButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
