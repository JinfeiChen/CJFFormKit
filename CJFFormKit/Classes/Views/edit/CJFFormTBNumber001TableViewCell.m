//
//  CJFFormTBNumber001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBNumber001TableViewCell.h"
#import <CJFFormKit/CJFTextField.h>

@implementation CJFFormTBNumber001Model

- (instancetype)init
{
    if (self = [super init]) {
        _increment = 1.0;
        _minValue = 0.0;
        _maxValue = 10000.0;
        _digits = 0;
    }
    return self;
}

@end

@interface CJFFormTBNumber001TableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *increaseButton;
@property (nonatomic, strong) UIButton *decreaseButton;
@property (strong, nonatomic) CJFTextField *textField; /**< <#property#> */
@property (nonatomic, strong) UIView *bgView;

@end

@implementation CJFFormTBNumber001TableViewCell

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
    
    [self.bgView addSubview:self.decreaseButton];
    [self.decreaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.bgView addSubview:self.increaseButton];
    [self.increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.right.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.bgView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bgView);
        make.left.mas_equalTo(self.decreaseButton.mas_right).offset(10);
        make.right.mas_equalTo(self.increaseButton.mas_left).offset(-10);
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
    self.model = [CJFFormTBNumber001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
    
    self.textField.placeholder = self.model.placeholder ? : @"Please Input";
    self.textField.text = [self getRoundFloat:[self.model.value floatValue] withPrecisionNum:self.model.digits];
    
    self.bgView.userInteractionEnabled = self.model.isEditable;
}

#pragma mark - Private Methods

/**
 基础计算 截取指定小数位数 时间耗时较少
 */
- (NSString *)getRoundFloat:(double)floatNumber withPrecisionNum:(NSInteger)precision {
    
    // 0.123456789  精度2
    
    //core foundation 的当前确切时间
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    
    //精度要求为2，算出 10的2次方，也就是100，让小数点右移两位，让原始小数扩大100倍
    double fact = pow(10,precision);//face = 100
    //让小数扩大100倍，四舍五入后面的位数，再缩小100倍，这样成功的进行指定精度的四舍五入
    double result = round(fact * floatNumber) / fact; // result = 0.12
    //组合成字符串 @"%.3f"   想要打印百分号%字符串 需要在前面加一个百分号 表示不转译
    NSString *proString = [NSString stringWithFormat:@"%%.%ldf",(long)precision]; //proString = @"%.2f"
    // 默认会显示6位 多余的n补0，所以需要指定显示多少小数位  @"%.2f" 0.123000
    NSString *resultString = [NSString stringWithFormat:proString,result];
    
    //time实际上是一个double
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();

    NSLog(@"time cost: %0.6f", end - start);
    
    return resultString;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location >= 40) return NO;
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    // 精准控制小数点位数
    if ([toBeString containsString:@"."]) {
        NSRange subRange = [toBeString rangeOfString:@"."];
        if (toBeString.length - subRange.location > self.model.digits + 1) { //如果输入框小数点后大于2位小数
            textField.text = [toBeString substringToIndex:toBeString.length - 1];
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"最多保留2位小数哦!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
            return NO;
        }
    }
    self.model.value = toBeString;

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
    return YES;
}

#pragma mark - Actions

- (void)decreaseButtonAction:(UIButton *)button
{
    CGFloat current = [self.textField.text floatValue];
    CGFloat result = (current - self.model.increment) > self.model.minValue ? (current - self.model.increment) : self.model.minValue;
    self.textField.text = [self getRoundFloat:result withPrecisionNum:self.model.digits];
}

- (void)increaseButtonAction:(UIButton *)button
{
    CGFloat current = [self.textField.text floatValue];
    CGFloat result = (current + self.model.increment) < self.model.maxValue ? (current + self.model.increment) : self.model.maxValue;
    self.textField.text = [self getRoundFloat:result withPrecisionNum:self.model.digits];
}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
//        _bgView.layer.masksToBounds = YES;
//        _bgView.layer.cornerRadius  = 8;
//        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UIButton *)decreaseButton
{
    if (!_decreaseButton) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"-" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(decreaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.layer.cornerRadius = 8.0;
        button.layer.masksToBounds = YES;
        _decreaseButton = button;
    }
    return _decreaseButton;
}

- (UIButton *)increaseButton
{
    if (!_increaseButton) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"+" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(increaseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.layer.cornerRadius = 8.0;
        button.layer.masksToBounds = YES;
        _increaseButton = button;
    }
    return _increaseButton;
}

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
        _textField.textAlignment = NSTextAlignmentCenter;

        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

@end
