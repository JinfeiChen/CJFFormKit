//
//  CJFFormTBSwitch001TableViewCell.m
//  Pods
//
//  Created by cjf on 8/12/2020.
//

#import "CJFFormTBSwitch001TableViewCell.h"

@implementation CJFFormTBSwitch001ButtonModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"idField" : @"id"
    };
}

@end


@implementation CJFFormTBSwitch001Model

@dynamic value;

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{
        @"value" : [CJFFormTBSwitch001ButtonModel class]
    };
}

@end



@interface CJFFormTBSwitch001TableViewCell ()

@property (nonatomic, strong) NSMutableArray *buttonArrayM;

@end

@implementation CJFFormTBSwitch001TableViewCell

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
}

#pragma mark - Public Methods

- (void)setModelWithDict:(NSDictionary *)dict format:(NSDictionary *)format
{
    if (!dict) {
        return;
    }
    
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if (format) {
        [format.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *key = [format objectForKey:obj];
            id value = [dict objectForKey:key];
            if (value) {
                [mDict setObject:value forKey:obj];
            }
        }];
    }
    self.model = [CJFFormTBSwitch001Model yy_modelWithJSON:mDict];
    self.TTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    
    if (self.model.value.count != self.buttonArrayM.count) {
        for (UIButton *button in self.buttonArrayM) {
            [button removeFromSuperview];
        }
        [self.buttonArrayM removeAllObjects];
    }
    
    if (self.model.value.count && !self.buttonArrayM.count) {
        for (int i = 0; i < self.model.value.count; ++i) {
            CJFFormTBSwitch001ButtonModel *model = self.model.value[i];
            UIButton *button = [[UIButton alloc]init];
            button.tag = i;
            [button setTitle:model.title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor whiteColor];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.layer.cornerRadius = 8.0;
            button.layer.masksToBounds = YES;
            [self.contentView addSubview:button];
            [self.buttonArrayM addObject:button];
            
        }
        [self.buttonArrayM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:self.cellStyle.contentInset.left tailSpacing:self.cellStyle.contentInset.right];
        [self.buttonArrayM mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.TTitleLabel.mas_bottom).offset(10);
            make.height.mas_equalTo(40);
            make.bottom.equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
        }];
    }
    
    for (int i = 0; i < self.model.value.count; ++i) {
        CJFFormTBSwitch001ButtonModel *model = self.model.value[i];
        UIButton *button = self.buttonArrayM[i];
        [button setTitle:model.title forState:UIControlStateNormal];
        button.selected = model.state;
        if (button.selected) {
            button.backgroundColor = [UIColor colorWithRed:255/255.0 green:194/255.0 blue:76/255.0 alpha:1.0];
        }else {
            button.backgroundColor = [UIColor whiteColor];
        }
    }
}

#pragma mark - Actions

- (void)buttonAction:(UIButton *)sender
{
    if (sender.selected) return;
    
    for (int i = 0; i < self.buttonArrayM.count; ++i) {
        UIButton *button = self.buttonArrayM[i];
        CJFFormTBSwitch001ButtonModel *model = self.model.value[i];
        
        if (sender.tag != button.tag) {
            model.state = button.selected = NO;
            button.backgroundColor = [UIColor whiteColor];
        }else {
            model.state = button.selected = YES;
            button.backgroundColor = [UIColor colorWithRed:255/255.0 green:194/255.0 blue:76/255.0 alpha:1.0];;
        }
    }
}

#pragma mark - Getters

- (UILabel *)TTitleLabel
{
    if (!_TTitleLabel) {
        _TTitleLabel = [[UILabel alloc] init];
        _TTitleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _TTitleLabel.textColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    }
    return _TTitleLabel;
}

- (NSMutableArray *)buttonArrayM
{
    if (!_buttonArrayM) {
        _buttonArrayM = [[NSMutableArray alloc] init];
    }
    return _buttonArrayM;
}

@end
