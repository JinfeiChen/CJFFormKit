//
//  CJFFormTBDate001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBDate001TableViewCell.h"

@implementation CJFFormTBDate001Model

@end

@interface CJFFormTBDate001TableViewCell ()

@property (nonatomic, strong) UITextField *textField;
@property (strong, nonatomic) UIButton *extButton; /**< <#property#> */

@end

@implementation CJFFormTBDate001TableViewCell

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
    
    [self.contentView addSubview:self.extButton];
    [self.extButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.textField);
        make.center.mas_equalTo(self.textField);
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
        [format.allKeys enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            NSString *key = [format objectForKey:obj];
            id value = [dict objectForKey:key];
            if (value) {
                [mDict setObject:value forKey:obj];
            }
        }];
    }
    self.model = [CJFFormTBDate001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;

    self.textField.placeholder = self.model.placeholder ? : @"Please Select";
    self.textField.text = self.model.value;
    
    self.textField.enabled = self.model.isEditable;
    self.textField.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
    
    self.extButton.enabled = self.model.isEditable;
}

#pragma mark - Actions

- (void)extButtonAction:(UIButton *)button
{
    // call back
    if (self.customDidSelectedBlock) {
        self.customDidSelectedBlock(self, self.model, nil);
    }
}

#pragma mark - Gettters

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = HEXCOLOR(0x565465);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.userInteractionEnabled = NO;
        _textField.returnKeyType = UIReturnKeyDone;
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        leftView.backgroundColor = [UIColor clearColor];
        UIButton *buttonView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [buttonView setImage:[UIImage imageNamed:@"ic_date" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        buttonView.userInteractionEnabled = NO;
        [leftView addSubview:buttonView];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UIButton *)extButton
{
    if (!_extButton) {
        _extButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_extButton setTitle:@"" forState:UIControlStateNormal];
        [_extButton addTarget:self action:@selector(extButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _extButton;
}

@end
