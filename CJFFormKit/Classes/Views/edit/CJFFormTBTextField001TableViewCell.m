//
//  CJFFormTBTextField001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBTextField001TableViewCell.h"
#import <CJFFormKit/CJFTextField.h>

@implementation CJFFormTBTextField001Model

@end

@interface CJFFormTBTextField001TableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) CJFTextField *textField;
@property (nonatomic, strong) UIView *deleteView;

@end

@implementation CJFFormTBTextField001TableViewCell

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

    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.left.equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
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
    self.model = [CJFFormTBTextField001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;

    self.textField.placeholder = self.model.placeholder ? : @"Please Input";
    self.textField.text = [NSString stringWithFormat:@"%@", self.model.value];

    if (self.model.value && [self.model.value length] > 0) {
        _textField.rightView = self.deleteView;
        _textField.rightViewMode = UITextFieldViewModeAlways;
    }else {
        _textField.rightView = nil;
        _textField.rightViewMode = UITextFieldViewModeNever;
    }
    
    self.textField.enabled = self.model.isEditable;
    self.textField.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location >= 40) return NO;
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.model.value = str;
    
    // call back
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    UITableView *tableView = (UITableView *)self.superview;
    [tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.model.value = @"";
    
    // call back
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
    }
    return YES;
}

#pragma mark - Actions

- (void)singleInputCellDeleteAction:(UIButton *)button
{
    self.textField.text = @"";
    self.model.value = @"";
    
    // call back
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
    }
}

#pragma mark - Getters

- (CJFTextField *)textField {
    if (_textField == nil) {
        _textField = [[CJFTextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = HEXCOLOR(0x565465);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeyDone;

        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor clearColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UIView *)deleteView {
    if (_deleteView == nil) {
        _deleteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        _deleteView.backgroundColor = [UIColor clearColor];
        UIButton *rightButton = [[UIButton alloc]initWithFrame:_deleteView.bounds];
        [rightButton addTarget:self action:@selector(singleInputCellDeleteAction:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:[UIImage imageNamed:@"search_clean"] forState:UIControlStateNormal];
        [_deleteView addSubview:rightButton];
    }
    return _deleteView;
}

@end
