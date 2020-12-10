//
//  CJFFormTBNumber001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBNumber001TableViewCell.h"

@implementation CJFFormTBNumber001Model

@end

@interface CJFFormTBNumber001TableViewCell ()

@end

@implementation CJFFormTBNumber001TableViewCell

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
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
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
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
}

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

@end
