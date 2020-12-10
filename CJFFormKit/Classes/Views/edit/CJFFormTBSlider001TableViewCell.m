//
//  CJFFormTBSlider001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBSlider001TableViewCell.h"
#import <CJFFormKit/CJFValueTrackingSlider.h>

@implementation CJFFormTBSlider001Model

@end

@interface CJFFormTBSlider001TableViewCell ()

@property (nonatomic, strong) CJFValueTrackingSlider *sliderView;

@end

@implementation CJFFormTBSlider001TableViewCell

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
    
    [self.contentView addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
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
    self.model = [CJFFormTBSlider001Model yy_modelWithJSON:mDict];
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    self.sliderView.minimumValue = self.model.minValue;
    self.sliderView.maximumValue = self.model.maxValue;
    self.sliderView.value = [self.model.value floatValue];
}

#pragma mark - Actions

- (void)sliderAction {
    NSLog(@"%f",_sliderView.value);
    self.model.value = [NSString stringWithFormat:@"%f", self.sliderView.value];
}

#pragma mark - Getters

- (CJFValueTrackingSlider *)sliderView {
    if (_sliderView == nil) {
        _sliderView = [[CJFValueTrackingSlider alloc] init];
        _sliderView.minimumValue = 0;
        _sliderView.font = [UIFont systemFontOfSize:14];
//        _sliderView.popUpViewColor = [UIColor clearColor];
        [_sliderView setMaxFractionDigitsDisplayed:2];
        [_sliderView addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sliderView;
}

@end
