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

    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(self.cellStyle.contentInset.top + 18 + 10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];

    [self.bgView addSubview:self.arrowButton];
    [self.arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
        make.width.height.equalTo(@40);
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
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];

    if (self.model.value.count) {
        self.placeholdLabel.text = @"";
    } else {
        self.placeholdLabel.text = self.model.placeholder;
    }

    if (self.model.privilege == CJFFormPrivilege_Write) {
        self.arrowButton.hidden = NO;
        self.tagView.deleteImage = [UIImage imageNamed:@"search_close_tag" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
    } else {
        self.arrowButton.hidden = YES;
        self.tagView.deleteImage = nil;
    }

    NSMutableArray *titleArrayM = [NSMutableArray array];
    for (CJFFormTBMultiSelect001ItemModel *model in self.model.value) {
        [titleArrayM addObject:model.name];
    }
    self.tagView.dataArray = titleArrayM;

    [UIView animateWithDuration:0.3 animations:^{
        if (self.model.isSelected) {
            self.arrowButton.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            self.arrowButton.transform = CGAffineTransformIdentity;
        }
    }];
    
}

#pragma mark - RATagViewDelegate

- (void)tagView:(CJFTagView *)tagView didSelectAtIndex:(NSInteger)index {
//    if ([self.delegate respondsToSelector:@selector(tableVieCell:didSelectAtIndex:)] && !self.dataModel.notEdit) {
//        [self.delegate tableVieCell:self didSelectAtIndex:index];
//    }
}

#pragma mark - lazy load

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
