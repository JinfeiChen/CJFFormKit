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

    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 10 * 2 - 10 * 2 - 8) / 2;
    [self.contentView addSubview:self.minTextField];
    [self.minTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.left.equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(width);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
    }];

    [self.contentView addSubview:self.maxTextField];
    [self.maxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
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
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;

    self.minTextField.placeholder = self.model.minPlaceholder ? : @"Please Input";
    self.minTextField.text = [NSString stringWithFormat:@"%f", self.model.minValue];
    self.maxTextField.placeholder = self.model.maxPlaceholder ? : @"Please Input";
    self.maxTextField.text = [NSString stringWithFormat:@"%f", self.model.maxValue];
    
    self.minTextField.enabled = self.model.isEditable;
    self.minTextField.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
    self.maxTextField.enabled = self.model.isEditable;
    self.maxTextField.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location > self.model.maxValue) return NO;
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];

    if (textField.tag == 100) {
        self.model.minValue = [str floatValue];
    } else if (textField.tag == 101) {
        self.model.maxValue = [str floatValue];
    }
    
    // call back
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason
{
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
        _minTextField.tintColor = HEXCOLOR(0x184585);
        _minTextField.delegate = self;
        _minTextField.keyboardType = UIKeyboardTypeNumberPad;
        _minTextField.returnKeyType = UIReturnKeyDone;
        _minTextField.backgroundColor = [UIColor whiteColor];
        _minTextField.textAlignment = NSTextAlignmentCenter;
        _minTextField.layer.cornerRadius = 8.0;
        _minTextField.layer.masksToBounds = YES;

//        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
//        leftView.backgroundColor = [UIColor clearColor];
//        _minTextField.leftView = leftView;
//        _minTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _minTextField;
}

- (UITextField *)maxTextField {
    if (_maxTextField == nil) {
        _maxTextField = [[UITextField alloc] init];
        _maxTextField.tag = 101;
        _maxTextField.font = [UIFont systemFontOfSize:14];
        _maxTextField.textColor = HEXCOLOR(0x565465);
        _maxTextField.tintColor = HEXCOLOR(0x184585);
        _maxTextField.delegate = self;
        _maxTextField.keyboardType = UIKeyboardTypeNumberPad;
        _maxTextField.returnKeyType = UIReturnKeyDone;
        _maxTextField.backgroundColor = [UIColor whiteColor];
        _maxTextField.textAlignment = NSTextAlignmentCenter;
        _maxTextField.layer.cornerRadius = 8.0;
        _maxTextField.layer.masksToBounds = YES;

//        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
//        leftView.backgroundColor = [UIColor clearColor];
//        _maxTextField.leftView = leftView;
//        _maxTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _maxTextField;
}

@end
