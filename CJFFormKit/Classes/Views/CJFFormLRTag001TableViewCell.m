//
//  CJFFormLRTag001TableViewCell.m
//  Pods
//
//  Created by cjf on 2/12/2020.
//

#import "CJFFormLRTag001TableViewCell.h"

#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@implementation CJFFormLRTag001Model

@end

@implementation WYTagsModel

- (instancetype)initWithTagsDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

@interface CJFFormLRTag001TagCollectionViewCell ()

@end

@implementation CJFFormLRTag001TagCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:245/255.0 alpha:1.0];
        label.text = @"N/A";
        label.frame = self.contentView.bounds;
        label.font = [UIFont systemFontOfSize:14];
        label.layer.cornerRadius = 2.0;
        label.layer.masksToBounds = YES;
        label.layer.borderWidth = 1.0;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:144/255.0 green:147/255.0 blue:153/255.0 alpha:1.0];
        label.layer.borderColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:235/255.0 alpha:1.0].CGColor;
        [self.contentView addSubview:label];
        self.titleLabel = label;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

@end

@interface CJFFormLRTag001TableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *tagsArr;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CJFFormLRTag001TableViewCell

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
    [self.contentView addSubview:self.LTitleLabel];
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
    [self.LTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.style.contentInset.left);
        make.height.mas_equalTo(18);
    }];
    
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.style.contentInset.top);
        make.right.mas_equalTo(self.contentView).offset(-self.style.contentInset.right);
        make.bottom.mas_equalTo(self.contentView).offset(-self.style.contentInset.bottom);
        make.left.mas_equalTo(self.LTitleLabel.mas_right).offset(10);
    }];
    [self.collectionView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
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
    self.model = [CJFFormLRTag001Model yy_modelWithJSON:mDict];
    self.LTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.title];
    [self layoutIfNeeded]; // MARK: 必须手动调用一次，否则会导致后面collectionview的x位置获取不准确

    NSMutableArray *mArr = [NSMutableArray array];
    for (NSString *text in self.model.tags) {
        WYTagsModel *model = [[WYTagsModel alloc] initWithTagsDict:@{
                                  @"title": text,
                                  @"color": @"eb3027"
        }];
        [mArr addObject:model];
    }
    self.tagsArr = mArr;
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tagsArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYTagsModel *model = self.tagsArr[indexPath.row];
    CGFloat width = [self widthForLabel:[NSString stringWithFormat:@"%@", model.title] fontSize:16];
    return CGSizeMake(width + 10, 22);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormLRTag001TagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CJFFormLRTag001TagCollectionViewCell class]) forIndexPath:indexPath];
    WYTagsModel *model = self.tagsArr[indexPath.row];
    cell.titleLabel.text = model.title;
    return cell;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    // 先对bgview进行布局,这里需对bgView布局后collectionView宽度才会准确
//    self.bgView.frame = CGRectMake(0, 0, targetSize.width, 44);
//    [self.bgView layoutIfNeeded];
    
    // 在对collectionView进行布局
    CGFloat titleWidth = [self widthForLabel:self.model.title fontSize:14];
    self.collectionView.frame = CGRectMake(0, 0, targetSize.width - titleWidth - self.style.contentInset.left - self.style.contentInset.right - 10, 44);
    [self.collectionView layoutIfNeeded];
    
    // 由于这里collection的高度是动态的，这里cell的高度我们根据collection来计算
    CGSize collectionSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat cotentViewH = collectionSize.height + 22;
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, cotentViewH);
}

#pragma mark - Private Methods

/**
 *  计算文字长度
 */
- (CGFloat)widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
    return size.width;
}

#pragma mark - Getters

- (UILabel *)LTitleLabel
{
    if (!_LTitleLabel) {
        _LTitleLabel = [[UILabel alloc] init];
        _LTitleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        _LTitleLabel.textColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    }
    return _LTitleLabel;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];

        [_collectionView registerClass:[CJFFormLRTag001TagCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CJFFormLRTag001TagCollectionViewCell class])];
    }
    return _collectionView;
}

- (NSMutableArray *)tagsArr
{
    if (!_tagsArr) {
        _tagsArr = [[NSMutableArray alloc] init];
    }
    return _tagsArr;
}

@end
