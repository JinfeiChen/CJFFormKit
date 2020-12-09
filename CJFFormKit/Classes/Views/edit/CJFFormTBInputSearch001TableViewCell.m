//
//  CJFFormTBInputSearch001TableViewCell.m
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#import "CJFFormTBInputSearch001TableViewCell.h"

@interface CJFFormTBInputSearch001TableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *searchView;

@end

@implementation CJFFormTBInputSearch001TableViewCell

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
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-25);
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.dataModel.paramValue = @"";
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    [self inputSearchAction];
    self.dataModel.name = self.textField.text;
    if ([self.delegate respondsToSelector:@selector(RAAddContactsInputSearchCell:andText:)]) {
        [self.delegate RAAddContactsInputSearchCell:self andText:self.textField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self inputSearchAction];
    return YES;
}

- (void)inputSearchAction {
    [self.textField resignFirstResponder];
}

#pragma mark - Setters

- (void)setDataModel:(RAAddContactsChildCellModel *)dataModel {
    [super setDataModel:dataModel];
    self.textField.placeholder = dataModel.placeholdString;
    self.textField.text = dataModel.name;
}

#pragma mark - Getters

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = HEXCOLOR(0x565465);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius  = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeySearch;
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        _textField.rightView = self.searchView;
        _textField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UIView *)searchView {
    if (_searchView == nil) {
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        _searchView.backgroundColor = AppBgSelectedColor;
        UIButton *rightButton = [[UIButton alloc]initWithFrame:_searchView.bounds];
        [rightButton addTarget:self action:@selector(inputSearchAction) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_searchView addSubview:rightButton];
    }
    return _searchView;
}

@end
