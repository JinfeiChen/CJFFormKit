//
//  CJFFormFFGrid001TableViewCell.m
//  Pods
//
//  Created by cjf on 3/12/2020.
//

#import "CJFFormFFGrid001TableViewCell.h"

@implementation CJFFormFFGrid001ItemModel



@end

@implementation CJFFormFFGrid001Model



@end

static CGFloat kItemPadding = 5.0;
static CGFloat kItemHeight = 30.0;

@interface CJFFormFFGrid001SubCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *iconImageView; /**< <#property#> */
@property (strong, nonatomic) UILabel *textLabel; /**< <#property#> */

@property (strong, nonatomic) CJFFormFFGrid001ItemModel *model; /**< <#property#> */

@end

@implementation CJFFormFFGrid001SubCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    return self;
}

- (void)buildView
{
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_iconImageView];
    
    _textLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_textLabel];
    
    [self setupLayoutRule];
}

- (void)setupLayoutRule
{
    // 左图标、右文字
    CGFloat iconHeight = kItemHeight - kItemPadding * 2;
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(iconHeight, iconHeight));
        make.top.left.mas_equalTo(self.contentView).offset(kItemPadding);
    }];
    
    [self.textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(kItemPadding);
        make.right.bottom.mas_equalTo(self.contentView).offset(-kItemPadding);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8.0);
    }];
}

#pragma mark - Setters

- (void)setModel:(CJFFormFFGrid001ItemModel *)model
{
    _model = model;
    
    if ([model.imageUrl containsString:@"http://"] || [model.imageUrl containsString:@"https://"]) {
        
    } else {
        self.iconImageView.image = [UIImage imageNamed:model.imageUrl];
    }
    
    self.textLabel.text = [NSString stringWithFormat:@"%@", model.value];
}

@end

@implementation CJFFormFFGrid001SubCollectionViewFlowLayout



@end

@interface CJFFormFFGrid001TableViewCell ()

@property (strong, nonatomic) UICollectionView *collectionView; /**< <#property#> */
@property (strong, nonatomic) CJFFormFFGrid001SubCollectionViewFlowLayout *flowLayout; /**< <#property#> */

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
    self.model = [CJFFormFFGrid001Model yy_modelWithJSON:mDict];
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
}

#pragma mark - UICollectionViewDelegate/UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame) / self.flowLayout.columns, self.flowLayout.estimatedItemSize.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormFFGrid001SubCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CJFFormFFGrid001SubCollectionViewCell class]) forIndexPath:indexPath];
    cell.model = self.model.dataSource[indexPath.row];
    return cell;
}

#pragma mark - Getters

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];

        [_collectionView registerClass:[CJFFormFFGrid001SubCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CJFFormFFGrid001SubCollectionViewCell class])];
    }
    return _collectionView;
}

- (CJFFormFFGrid001SubCollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[CJFFormFFGrid001SubCollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.columns = 3;
        _flowLayout.estimatedItemSize = CGSizeMake(100, 40);
    }
    return _flowLayout;
}

@end
