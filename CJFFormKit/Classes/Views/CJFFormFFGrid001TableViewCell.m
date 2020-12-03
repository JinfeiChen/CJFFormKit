//
//  CJFFormFFGrid001TableViewCell.m
//  Pods
//
//  Created by cjf on 3/12/2020.
//

#import "CJFFormFFGrid001TableViewCell.h"

@interface CJFFormFFGrid001TableViewCell ()

@property (strong, nonatomic) UICollectionView *collectionView; /**< <#property#> */

@end

@implementation CJFFormFFGrid001TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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
    [self.contentView addSubview:self.collectionView];
}

// tell UIKit that you are using AutoLayout
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints {

    // --- remake/update constraints here
    [self setLayoutRule];
    
    //according to apple super should be called at end of method
    [super updateConstraints];
}

- (void)setLayoutRule
{
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.right.mas_equalTo(self.contentView).offset(-self.style.contentInset.right);
        make.bottom.mas_equalTo(self.contentView).offset(-self.style.contentInset.bottom);
        make.left.mas_equalTo(self.contentView).offset(self.style.contentInset.left);
    }];
}

@end
