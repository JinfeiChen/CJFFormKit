//
//  CJFFormTBUniSelect001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBUniSelect001TableViewCell.h"

@implementation CJFFormTBUniSelect001Model



@end

@interface CJFFormTBUniSelect001TableViewCell ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *placeHoldLabel;

@end

@implementation CJFFormTBUniSelect001TableViewCell

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
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-25);
    }];
    
    [self.bgView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.right.equalTo(self.bgView);
        make.height.equalTo(self.bgView);
        make.width.mas_equalTo(40);
    }];
    
    [self.bgView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView);
        make.left.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.rightButton.mas_left);
        make.bottom.equalTo(self.bgView);
    }];
    
    [self.bgView addSubview:self.placeHoldLabel];
    [self.placeHoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentLabel);
    }];
}

//- (void)setDataModel:(RAAddContactsChildCellModel *)dataModel {
//    [super setDataModel:dataModel];
//    if (!kStringIsEmpty(dataModel.name)) {
//        self.placeHoldLabel.hidden = YES;
//    }else {
//        self.placeHoldLabel.hidden = NO;
//    }
//    self.contentLabel.text = dataModel.name;
//    self.placeHoldLabel.text = dataModel.placeholdString;
//    [UIView animateWithDuration:0.3 animations:^{
//        if (dataModel.isSelected) {
//            self.rightButton.transform = CGAffineTransformMakeRotation(M_PI_2);
//        }else {
//            self.rightButton.transform = CGAffineTransformIdentity;
//        }
//    }];
//
//    self.rightButton.hidden = dataModel.notEdit;
//}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius  = 8;
        _bgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bgView;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = HEXCOLOR(0x565465);
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UILabel *)placeHoldLabel {
    if (_placeHoldLabel == nil) {
        _placeHoldLabel = [[UILabel alloc] init];
        _placeHoldLabel.font = [UIFont systemFontOfSize:14];
        _placeHoldLabel.textColor = RGB(208, 208, 209);
    }
    return _placeHoldLabel;
}

- (UIButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.userInteractionEnabled = NO;
        [_rightButton setImage:[UIImage imageNamed:@"search_next"] forState:UIControlStateNormal];
        _contentLabel.textColor = HEXCOLOR(0x565465);
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _rightButton;
}

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
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        rightView.backgroundColor = [UIColor whiteColor];
        _rightButton = [[UIButton alloc]initWithFrame:rightView.bounds];
        [_rightButton setImage:[UIImage imageNamed:@"search_drop_down"] forState:UIControlStateNormal];
        [rightView addSubview:_rightButton];
        _textField.rightView = rightView;
        _textField.rightViewMode = UITextFieldViewModeAlways;
        
    }
    return _textField;
}

@end
