//
//  CJFFormTBRange001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBRange001TableViewCell.h"

@implementation CJFFormTBRange001Model

@end

@interface CJFFormTBRange001TableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UITextField *minTextField;
@property (nonatomic, strong) UITextField *maxTextField;

@end

@implementation CJFFormTBRange001TableViewCell

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
    
    CGFloat width = (IMSScreen_Width - 10*2 -10*2 -8)/2;
    [self.contentView addSubview:self.minTextField];
    [self.minTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(width);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];

    [self.contentView addSubview:self.maxTextField];
    [self.maxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.height.width.centerY.equalTo(self.minTextField);
    }];
    
    [self.contentView addSubview:self.lineLabel];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.minTextField.mas_right).offset(10);
        make.width.mas_equalTo(8);
        make.centerY.equalTo(self.maxTextField);
        make.right.equalTo(self.maxTextField.mas_left).offset(-10);
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
    self.model = [CJFFormTBRange001Model yy_modelWithJSON:mDict];
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    self.minTextField.placeholder = self.model.placeholder;
    self.minTextField.text = dataModel.name;
    self.maxTextField.placeholder = dataModel.placeholdStringTwo;
    self.maxTextField.text = dataModel.nameTwo;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location > self.dataModel.maxCount) return NO;
    NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField.tag == 100) {
        self.dataModel.name = str;
        self.dataModel.paramValue = @(str.integerValue);
    }else if (textField.tag == 101) {
        self.dataModel.nameTwo = str;
        self.dataModel.paramValueTwo = @(str.integerValue);
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    if (self.dataModel.name.integerValue > self.dataModel.nameTwo.integerValue) {
        self.dataModel.showTipType = RAAddContactsShowTipType_mustSelectTipError;
    }else {
        self.dataModel.showTipType = RAAddContactsShowTipType_non;
    }
    UITableView *tableView = (UITableView *)self.superview;
    [tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Getters

- (UILabel *)lineLabel {
    if (_lineLabel == nil) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.text = @"-";
    }
    return _lineLabel;
}

- (UITextField *)minTextField {
    if (_minTextField == nil) {
        _minTextField = [[UITextField alloc] init];
        _minTextField.tag = 100;
        _minTextField.font = [UIFont systemFontOfSize:14];
        _minTextField.textColor = HEXCOLOR(0x565465);
        _minTextField.tintColor = AppMainColor;
        _minTextField.delegate = self;
        _minTextField.keyboardType = UIKeyboardTypeNumberPad;
        _minTextField.returnKeyType = UIReturnKeyDone;
        _minTextField.backgroundColor = [UIColor whiteColor];
        _minTextField.textAlignment = NSTextAlignmentCenter;
        [_minTextField rounded:8];
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _minTextField.leftView = leftView;
        _minTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _minTextField;
}

- (UITextField *)maxTextField {
    if (_maxTextField == nil) {
        _maxTextField = [[UITextField alloc] init];
        _maxTextField.tag = 101;
        _maxTextField.font = [UIFont systemFontOfSize:14];
        _maxTextField.textColor = HEXCOLOR(0x565465);
        _maxTextField.tintColor = AppMainColor;
        _maxTextField.delegate = self;
        _maxTextField.keyboardType = UIKeyboardTypeNumberPad;
        _maxTextField.returnKeyType = UIReturnKeyDone;
        _maxTextField.backgroundColor = [UIColor whiteColor];
        _maxTextField.textAlignment = NSTextAlignmentCenter;
        [_maxTextField rounded:8];
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _maxTextField.leftView = leftView;
        _maxTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _maxTextField;
}

@end
