//
//  CJFFormTBMultiSelect001TableViewCell.m
//  Pods
//
//  Created by cjf on 9/12/2020.
//

#import "CJFFormTBMultiSelect001TableViewCell.h"

#import <CJFFormKit/CJFTagView.h>

@interface CJFFormTBMultiSelect001TableViewCell ()<CJFTagViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *placeholdLabel;
@property (nonatomic, strong) UIButton *arrowButton;
@property (nonatomic, strong) CJFTagView *tagView;

@end

@implementation CJFFormTBMultiSelect001TableViewCell

- (void)setupUI {
    
    [super setupUI];
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-25);
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
        make.height.mas_equalTo(40);
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

- (void)setDataModel:(RAAddContactsChildCellModel *)dataModel {
    [super setDataModel:dataModel];
    
    if (dataModel.selectDataArrayM.count) {
        self.placeholdLabel.text = @"";
    }else {
        self.placeholdLabel.text = dataModel.placeholdString;
    }
    
    if (!dataModel.notEdit) {
        self.arrowButton.hidden = NO;
        self.tagView.deleteImage = [UIImage imageNamed:@"search_close_tag"];
    }else {
        self.arrowButton.hidden = YES;
        self.tagView.deleteImage = nil;
    }
    
    NSMutableArray *titleArrayM = [NSMutableArray array];
    for (RAContactNaviFilterModel *model in dataModel.selectDataArrayM) {
        [titleArrayM addObject:model.name];
    }
    self.tagView.dataArray = titleArrayM;
    
    [UIView animateWithDuration:0.3 animations:^{
        if (dataModel.isSelected) {
            self.arrowButton.transform = CGAffineTransformMakeRotation(M_PI_2);
        }else {
            self.arrowButton.transform = CGAffineTransformIdentity;
        }
    }];
}

#pragma mark - RATagViewDelegate
- (void)tagView:(RATagView *)tagView didSelectAtIndex:(NSInteger)index {
    
    if ([self.delegate respondsToSelector:@selector(tableVieCell:didSelectAtIndex:)] && !self.dataModel.notEdit) {
        [self.delegate tableVieCell:self didSelectAtIndex:index];
    }
}


#pragma mark - lazy load
- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        [_bgView rounded:8];
    }
    return _bgView;
}

- (UILabel *)placeholdLabel {
    if (_placeholdLabel == nil) {
        _placeholdLabel = [[UILabel alloc] init];
        _placeholdLabel.textColor = HEXCOLOR(0xC4C7D1);
        _placeholdLabel.font = [UIFont systemFontOfSize:14];
    }
    return _placeholdLabel;
}

- (UIButton *)arrowButton {
    if (_arrowButton == nil) {
        _arrowButton = [[UIButton alloc] init];
        [_arrowButton setImage:[UIImage imageNamed:@"search_next"] forState:UIControlStateNormal];
        _arrowButton.userInteractionEnabled = NO;
    }
    return _arrowButton;
}

- (RATagView *)tagView {
    if (_tagView == nil) {
        _tagView = [[RATagView alloc] init];
        _tagView.minimumLineSpacing = 5;
        _tagView.tagsMinPadding = 10;
        _tagView.minimumInteritemSpacing = 5;
        _tagView.tagItemfontSize = [UIFont systemFontOfSize:11];
        _tagView.tagItemHeight = 25.0;
        _tagView.contentInset = UIEdgeInsetsMake(7.5, 10, 7.5, 0);
        _tagView.tagSuperviewWidth = IMSScreen_Width - 60;
        _tagView.contentPadding = 5.0;
        _tagView.tagSuperviewMinHeight = 40.0;
        _tagView.deleteImage = [UIImage imageNamed:@"search_close_tag"];
        _tagView.delegate = self;
    }
    return _tagView;
}

@end
