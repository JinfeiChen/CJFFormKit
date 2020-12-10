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

@end

@implementation CJFFormTBDate001TableViewCell

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
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    self.textField.placeholder = self.model.placeholder;
    self.textField.text = self.model.value;
}

#pragma mark - Gettters

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = HEXCOLOR(0x565465);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius  = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.userInteractionEnabled = NO;
        _textField.returnKeyType = UIReturnKeyDone;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        UIButton *buttonView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [buttonView setImage:[UIImage imageNamed:@"ic_date" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        buttonView.userInteractionEnabled = NO;
        [leftView addSubview:buttonView];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

@end
