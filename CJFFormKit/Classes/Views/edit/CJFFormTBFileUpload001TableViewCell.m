//
//  CJFFormTBFileUpload001TableViewCell.m
//  Pods
//
//  Created by cjf on 15/12/2020.
//

#import "CJFFormTBFileUpload001TableViewCell.h"

@implementation CJFFormTBFileUpload001Model

@dynamic value;

@end

@interface CJFFormTBFileUpload001TableViewCell ()

@property (strong, nonatomic) UITableView *tableView; /**< <#property#> */

@end

@implementation CJFFormTBFileUpload001TableViewCell

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
//        make.height.mas_equalTo(18);
    }];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.right.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.bottom.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
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
    self.model = [CJFFormTBImageUpload001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
}

#pragma mark - Getters


@end
