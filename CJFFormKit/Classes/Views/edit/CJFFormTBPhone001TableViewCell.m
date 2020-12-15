//
//  CJFFormTBPhone001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBPhone001TableViewCell.h"

@implementation CJFFormTBPhone001Model

@end

@interface CJFFormTBPhone001TableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *phoneAreaLabel;
@property (nonatomic, strong) UIImageView *lineLabel;
@property (nonatomic, strong) UIImageView *searchDownImageView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *deleteView;

@end

@implementation CJFFormTBPhone001TableViewCell

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

    [self.bgView addSubview:self.phoneAreaLabel];
    [self.phoneAreaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bgView);
        make.left.equalTo(self.bgView).offset(10);
        make.width.mas_equalTo(60);
    }];

    [self.bgView addSubview:self.searchDownImageView];
    [self.searchDownImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneAreaLabel);
        make.left.equalTo(self.phoneAreaLabel.mas_right).offset(5);
        make.width.mas_equalTo(9);
        make.height.mas_equalTo(6);
    }];

    [self.bgView addSubview:self.lineLabel];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bgView);
        make.left.equalTo(self.searchDownImageView.mas_right).offset(10);
        make.width.mas_equalTo(0.5);
    }];

    [self.bgView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.bgView);
        make.left.equalTo(self.lineLabel.mas_right);
    }];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgViewTapAction)];
    [self.bgView addGestureRecognizer:tap];
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
    self.model = [CJFFormTBPhone001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;

    self.phoneAreaLabel.text = [NSString stringWithFormat:@"%@ %@", self.model.countryCode, self.model.countryArea];
    self.phoneAreaLabel.text = [NSString stringWithFormat:@"%@", self.model.countryCode];
    self.textField.placeholder = self.model.placeholder ? : @"Please Input";
    self.textField.text = self.model.value;

    [UIView animateWithDuration:0.3 animations:^{
        if (self.model.isSelected) {
            self.searchDownImageView.transform = CGAffineTransformMakeRotation(M_PI);
        } else {
            self.searchDownImageView.transform = CGAffineTransformIdentity;
        }
    }];

    if (self.model.isEditable) {
        if (self.model.value && [self.model.value length] > 0) {
            _textField.rightView = self.deleteView;
            _textField.rightViewMode = UITextFieldViewModeAlways;
        }
    }
    
    self.bgView.userInteractionEnabled = self.model.isEditable;
}

#pragma mark - Actions

- (void)bgViewTapAction
{
    if (self.customDidSelectedBlock) {
        self.customDidSelectedBlock(self, self.model, nil);
    }
}

- (void)phonCellDeleteAction:(UIButton *)button
{
    self.textField.text = @"";
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    self.model.value = str;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    UITableView *tableView = (UITableView *)self.superview;
    [tableView reloadData];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.model.value = @"";
    return YES;
}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 8.0;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UILabel *)phoneAreaLabel {
    if (_phoneAreaLabel == nil) {
        _phoneAreaLabel = [[UILabel alloc] init];
        _phoneAreaLabel.textColor = HEXCOLOR(0x565465);
        _phoneAreaLabel.font = [UIFont systemFontOfSize:14];
        _phoneAreaLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _phoneAreaLabel;
}

- (UIImageView *)searchDownImageView {
    if (_searchDownImageView == nil) {
        _searchDownImageView = [[UIImageView alloc] init];
        _searchDownImageView.image = [UIImage imageNamed:@"search_down" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
    }
    return _searchDownImageView;
}

- (UIImageView *)lineLabel {
    if (_lineLabel == nil) {
        _lineLabel = [[UIImageView alloc] init];
        _lineLabel.backgroundColor = HEXCOLOR(0xD6DCDF);
    }
    return _lineLabel;
}

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = HEXCOLOR(0x565465);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypePhonePad;
        _textField.returnKeyType = UIReturnKeyDone;

        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UIView *)deleteView {
    if (_deleteView == nil) {
        _deleteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        _deleteView.backgroundColor = [UIColor whiteColor];
        UIButton *rightButton = [[UIButton alloc]initWithFrame:_deleteView.bounds];
        [rightButton addTarget:self action:@selector(phonCellDeleteAction:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:[UIImage imageNamed:@"search_clean" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_deleteView addSubview:rightButton];
    }
    return _deleteView;
}

@end
