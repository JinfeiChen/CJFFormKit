//
//  CJFFormTBInputSearch001TableViewCell.m
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#import "CJFFormTBInputSearch001TableViewCell.h"

@implementation CJFFormTBInputSearch001Model

@end

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
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).mas_offset(10);
        make.left.equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.model.value = @"";
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)) {
    [self inputSearchAction];
    self.model.value = self.textField.text;
//    if ([self.delegate respondsToSelector:@selector(RAAddContactsInputSearchCell:andText:)]) {
//        [self.delegate RAAddContactsInputSearchCell:self andText:self.textField.text];
//    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self inputSearchAction];
    return YES;
}

- (void)inputSearchAction {
    [self.textField resignFirstResponder];
}

#pragma mark - Setters

//- (void)setDataModel:(RAAddContactsChildCellModel *)dataModel {
//    [super setDataModel:dataModel];
//    self.textField.placeholder = dataModel.placeholdString;
//    self.textField.text = dataModel.name;
//}

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
    self.model = [CJFFormTBInputSearch001Model yy_modelWithJSON:mDict];
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    self.textField.placeholder = [NSString stringWithFormat:@"%@", self.model.placeholder ? : @"Please Input"];
    self.textField.text = [NSString stringWithFormat:@"%@", self.model.value];
}

#pragma mark - Getters

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = kCJFFormHexColor(0x565465);
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
        _searchView.backgroundColor = kCJFFormMainColor;
        UIButton *rightButton = [[UIButton alloc]initWithFrame:_searchView.bounds];
        [rightButton addTarget:self action:@selector(inputSearchAction) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:[UIImage imageNamed:@"search" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_searchView addSubview:rightButton];
    }
    return _searchView;
}

@end
