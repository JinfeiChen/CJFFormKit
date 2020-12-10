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
    
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-25);
    }];
}

//- (void)setDataModel:(RAAddContactsChildCellModel *)dataModel {
//    [super setDataModel:dataModel];
//    self.textField.placeholder = dataModel.placeholdString;
//    self.textField.text = dataModel.name;
//    
//    if (dataModel.isShowDelete) {
//        _textField.rightView = self.deleteView;
//        _textField.rightViewMode = UITextFieldViewModeAlways;
//    }else {
//        _textField.rightView = nil;
//        _textField.rightViewMode = UITextFieldViewModeNever;
//    }
//}

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
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    self.textField.placeholder = self.model.placeholder;
    self.textField.text = dataModel.name;
    
//    if (self.model.isShowDelete) {
//        _textField.rightView = self.deleteView;
//        _textField.rightViewMode = UITextFieldViewModeAlways;
//    }else {
//        _textField.rightView = nil;
//        _textField.rightViewMode = UITextFieldViewModeNever;
//    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location >= 40)  return NO;
    NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.dataModel.name = self.dataModel.paramValue = str;
    if (kStringIsEmpty(str)) {
         self.dataModel.showTipType = RAAddContactsShowTipType_mustSelectTipError;
    }else {
         self.dataModel.showTipType = RAAddContactsShowTipType_non;
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
    self.dataModel.name = self.dataModel.paramValue = @"";
    self.dataModel.showTipType = RAAddContactsShowTipType_mustSelectTipError;
    return YES;
}

- (void)singleInputCellDeleteAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(RAAddContactsSingleInputCell:andDeleteButton:)]) {
        [self.delegate RAAddContactsSingleInputCell:self andDeleteButton:button];
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
        _textField.layer.cornerRadius  = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.delegate = self;
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
        [rightButton addTarget:self action:@selector(singleInputCellDeleteAction:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:[UIImage imageNamed:@"search_clean"] forState:UIControlStateNormal];
        [_deleteView addSubview:rightButton];
    }
    return _deleteView;
}

@end