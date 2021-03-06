//
//  CJFFormTBMultiSelect001TableViewCell.m
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#import "CJFFormTBMultiSelect001TableViewCell.h"

#import <CJFFormKit/CJFTagView.h>

@implementation CJFFormTBMultiSelect001ItemModel

@end

@implementation CJFFormTBMultiSelect001Model

@dynamic value;

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{
        @"value": [CJFFormTBMultiSelect001ItemModel class]
    };
}

@end

@interface CJFFormTBMultiSelect001TableViewCell ()<CJFTagViewDelegate>

@property (strong, nonatomic) UIView *containerView; /**< <#property#> */
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *placeholdLabel;
@property (nonatomic, strong) UIButton *arrowButton;
@property (nonatomic, strong) CJFTagView *tagView;

@end

@implementation CJFFormTBMultiSelect001TableViewCell

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
        make.top.equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.left.equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
    }];

    [self.bgView addSubview:self.arrowButton];
    [self.arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.right.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
        make.width.equalTo(@40);
    }];

    [self.bgView addSubview:self.tagView];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView);
        make.left.equalTo(self.bgView);
        make.right.equalTo(self.arrowButton.mas_left);
        make.bottom.equalTo(self.bgView);
    }];

    [self.bgView addSubview:self.placeholdLabel];
    [self.placeholdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(10);
        make.top.equalTo(self.bgView);
        make.height.mas_equalTo(40);
        make.right.equalTo(self.arrowButton.mas_left).offset(-10);
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
    self.model = [CJFFormTBMultiSelect001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;

    if (self.model.value.count) {
        self.placeholdLabel.text = @"";
    } else {
        self.placeholdLabel.text = self.model.placeholder ? : @"Please Select";
    }

    if (self.model.isEditable) {
        self.arrowButton.hidden = NO;
        self.tagView.deleteImage = [UIImage imageNamed:@"search_close_tag" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
    } else {
        self.arrowButton.hidden = YES;
        self.tagView.deleteImage = nil;
    }

    [self updateTagViewDataSource];

    [UIView animateWithDuration:0.3 animations:^{
        if (self.model.isSelected) {
            self.arrowButton.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            self.arrowButton.transform = CGAffineTransformIdentity;
        }
    }];
    
    self.bgView.userInteractionEnabled = self.model.isEditable;
    self.bgView.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
}

#pragma mark - Private Methods

- (void)updateTagViewDataSource
{
    NSMutableArray *titleArrayM = [NSMutableArray array];
    for (CJFFormTBMultiSelect001ItemModel *model in self.model.value) {
        [titleArrayM addObject:model.name];
    }
    self.tagView.dataArray = titleArrayM;
}

#pragma mark - RATagViewDelegate

- (void)tagView:(CJFTagView *)tagView didSelectAtIndex:(NSInteger)index {

    NSMutableArray *mArr = [NSMutableArray arrayWithArray:self.model.value];
    [mArr removeObjectAtIndex:index];
    self.model.value = mArr;
    [self updateTagViewDataSource];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
    // call back
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
    }
}

#pragma mark - Actions

- (void)clickAction:(id)sender
{
    // call back
    if (self.customDidSelectedBlock) {
        self.customDidSelectedBlock(self, self.model, nil);
    }
}

#pragma mark - Getters

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 8.0;
        _bgView.layer.masksToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (UILabel *)placeholdLabel {
    if (_placeholdLabel == nil) {
        _placeholdLabel = [[UILabel alloc] init];
        _placeholdLabel.textColor = kCJFFormHexColor(0xC4C7D1);
        _placeholdLabel.font = [UIFont systemFontOfSize:14];
    }
    return _placeholdLabel;
}

- (UIButton *)arrowButton {
    if (_arrowButton == nil) {
        _arrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_arrowButton setImage:[UIImage imageNamed:@"search_next" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _arrowButton.userInteractionEnabled = NO;
//        [_arrowButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _arrowButton;
}

- (CJFTagView *)tagView {
    if (_tagView == nil) {
        _tagView = [[CJFTagView alloc] init];
        _tagView.minimumLineSpacing = 5;
        _tagView.tagsMinPadding = 10;
        _tagView.minimumInteritemSpacing = 5;
        _tagView.tagItemfontSize = [UIFont systemFontOfSize:11];
        _tagView.tagItemHeight = 25.0;
        _tagView.contentInset = UIEdgeInsetsMake(7.5, 10, 7.5, 0);
        _tagView.tagSuperviewWidth = [UIScreen mainScreen].bounds.size.width - 60;
        _tagView.contentPadding = 5.0;
        _tagView.tagSuperviewMinHeight = 40.0;
        _tagView.deleteImage = [UIImage imageNamed:@"search_close_tag" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
        _tagView.delegate = self;
    }
    return _tagView;
}

@end
