//
//  CJFFormTBSwitch002TableViewCell.m
//  Pods
//
//  Created by cjf on 25/12/2020.
//

#import "CJFFormTBSwitch002TableViewCell.h"

@implementation CJFFormTBSwitch002Model

@end

@interface CJFFormTBSwitch002TableViewCell ()

@property (nonatomic, strong) UIView *bgView;
@property (strong, nonatomic) UIView *indicatorView; /**< <#property#> */

@property (assign, nonatomic, getter=isMySelected) BOOL mySelected; /**< <#property#> */

@end

@implementation CJFFormTBSwitch002TableViewCell

@dynamic model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _mySelected = NO;
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
    
    CGFloat padding = 5.0;
    [self.bgView addSubview:self.indicatorView];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.bgView.mas_width).offset(-2 * padding).multipliedBy(0.5);
        make.height.mas_equalTo(self.bgView.mas_height).offset(-2 * padding).multipliedBy(1);
        make.centerX.mas_equalTo(self.bgView).multipliedBy(0.5);
        make.centerY.mas_equalTo(self.bgView);
    }];
}

- (void)updateMySeleteStatus
{
    CGFloat padding = 4.0;
    if (self.isMySelected) {
        [self.indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.bgView.mas_width).offset(-2 * padding).multipliedBy(0.5);
            make.height.mas_equalTo(self.bgView.mas_height).offset(-2 * padding).multipliedBy(1);
            make.centerX.mas_equalTo(self.bgView).multipliedBy(1.5);
            make.centerY.mas_equalTo(self.bgView);
        }];
        self.bgView.layer.borderColor = [UIColor colorWithRed:255 / 255.0 green:194 / 255.0 blue:76 / 255.0 alpha:1.0].CGColor;
        self.bgView.layer.borderWidth = 1.0;
        self.bgView.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:194 / 255.0 blue:76 / 255.0 alpha:1.0];
    } else {
        [self.indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.bgView.mas_width).offset(-2 * padding).multipliedBy(0.5);
            make.height.mas_equalTo(self.bgView.mas_height).offset(-2 * padding).multipliedBy(1);
            make.centerX.mas_equalTo(self.bgView).multipliedBy(0.5);
            make.centerY.mas_equalTo(self.bgView);
        }];
        self.bgView.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:1.0].CGColor;
        self.bgView.layer.borderWidth = 1.0;
        self.bgView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    }
    
    [self layoutIfNeeded];
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
    self.model = [CJFFormTBSwitch002Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required ? @"* " : @"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
         NSFontAttributeName: [UIFont systemFontOfSize:16.0],
         NSForegroundColorAttributeName: [UIColor redColor]
     } range:self.model.required ? NSMakeRange(0, 1) : NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
    
    self.mySelected = [self.model.value boolValue];
    
    [self updateMySeleteStatus];
    
    self.bgView.userInteractionEnabled = self.model.isEditable;
}

#pragma mark - Actions

- (void)clickAction:(id)sender
{
    CGPoint point = [sender locationInView:self.bgView];
    self.model.value = @((point.x > CGRectGetWidth(self.bgView.frame) / 2) ? YES : NO);
    if (self.mySelected == [self.model.value boolValue]) {
        return;
    }
    self.mySelected = [self.model.value boolValue];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self updateMySeleteStatus];

    } completion:^(BOOL finished) {
        
        // call back
        if (self.didUpdateFormModelBlock) {
            self.didUpdateFormModelBlock(self, self.model, nil);
        }
        
    }];
}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius  = 8;
        _bgView.layer.borderColor = [UIColor grayColor].CGColor;
        _bgView.layer.borderWidth = 1.0;
        _bgView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (UIView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
//        _indicatorView.layer.masksToBounds = YES;
        _indicatorView.layer.cornerRadius  = 6;
        _indicatorView.backgroundColor= [UIColor whiteColor];
        _indicatorView.layer.shadowColor = [UIColor blackColor].CGColor;
        _indicatorView.layer.shadowOffset = CGSizeMake(0,0);
        _indicatorView.layer.shadowOpacity = 0.05;
        _indicatorView.layer.shadowRadius = 5;
    }
    return _indicatorView;
}

@end
