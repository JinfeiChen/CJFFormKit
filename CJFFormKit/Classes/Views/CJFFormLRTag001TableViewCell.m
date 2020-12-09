//
//  CJFFormLRTag001TableViewCell.m
//  Pods
//
//  Created by cjf on 2/12/2020.
//

#import "CJFFormLRTag001TableViewCell.h"

static CGFloat kFontSize = 14.0;

@implementation CJFFormLRTag001Model

@dynamic value;

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
        label.font = [UIFont systemFontOfSize:kFontSize];
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

@implementation CJFFormLRTag001TagCollectionViewFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
        _maximumInteritemSpacing = 10.0;
    }
    return self;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    [attributes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0) {
            UICollectionViewLayoutAttributes *currentAttributes = obj;
            UICollectionViewLayoutAttributes *prevAttributes = attributes[idx - 1];
            CGFloat maximumSpacing = self.maximumInteritemSpacing;// 最大间距
            CGFloat originX = CGRectGetMaxX(prevAttributes.frame);
            if (originX + maximumSpacing + currentAttributes.frame.size.width < self.collectionViewContentSize.width) {
                CGRect frame = currentAttributes.frame;
                frame.origin.x = originX + maximumSpacing;
                currentAttributes.frame = frame;
            }
        }
    }];
    return attributes;
}

@end

@interface CJFFormLRTag001TagCollectionView : UICollectionView

@end

@implementation CJFFormLRTag001TagCollectionView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([hitView isKindOfClass:[self class]]) {
        return nil;
    } else {
        return hitView;
    }
}

@end

@interface CJFFormLRTag001TableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *tagsArr;

@property (nonatomic, strong) CJFFormLRTag001TagCollectionView *collectionView;
@property (assign, nonatomic) BOOL hasTitleText; /**< <#property#> */

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
    _hasTitleText = YES;
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
        make.top.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.top);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.height.mas_equalTo(18);
    }];
    
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.top);
        make.right.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.bottom.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
        make.left.mas_equalTo(self.LTitleLabel.mas_right).offset(self.hasTitleText?10:0);
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

    NSMutableArray *mArr = [NSMutableArray array];
    for (NSString *text in self.model.value) {
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

#pragma mark - UICollectionViewDelegate/UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tagsArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYTagsModel *model = self.tagsArr[indexPath.row];
    CGFloat width = [self widthForLabel:[NSString stringWithFormat:@"%@", model.title] fontSize:kFontSize];
    return CGSizeMake(MIN(CGRectGetWidth(collectionView.frame), width + 10), 22);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormLRTag001TagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CJFFormLRTag001TagCollectionViewCell class]) forIndexPath:indexPath];
    WYTagsModel *model = self.tagsArr[indexPath.row];
    cell.titleLabel.text = model.title;
    return cell;
}

#pragma mark - UIView (UIConstraintBasedLayoutFittingSize)

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    // 先对bgview进行布局,这里需对bgView布局后collectionView宽度才会准确
//    self.bgView.frame = CGRectMake(0, 0, targetSize.width, 44);
//    [self.bgView layoutIfNeeded];
    
    // 在对collectionView进行布局
    CGFloat titleWidth = [self widthForLabel:self.model.title fontSize:kFontSize];
    self.hasTitleText = titleWidth > 0;
    self.collectionView.frame = CGRectMake(0, 0, targetSize.width - titleWidth - self.cellStyle.contentInset.left - self.cellStyle.contentInset.right - (self.hasTitleText?10:0), 44);
    [self.collectionView layoutIfNeeded];
    
    // 由于这里collection的高度是动态的，这里cell的高度我们根据collection来计算
    CGSize collectionSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat contentViewHeight = collectionSize.height + self.cellStyle.contentInset.top + self.cellStyle.contentInset.bottom;
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, contentViewHeight);
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
        _LTitleLabel.font = [UIFont systemFontOfSize:kFontSize weight:UIFontWeightRegular];
        _LTitleLabel.textColor = [UIColor colorWithRed:159 / 255.0 green:162 / 255.0 blue:168 / 255.0 alpha:1.0];
    }
    return _LTitleLabel;
}

- (CJFFormLRTag001TagCollectionView *)collectionView
{
    if (!_collectionView) {
        CJFFormLRTag001TagCollectionViewFlowLayout *layout = [[CJFFormLRTag001TagCollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        layout.maximumInteritemSpacing = 8;
        _collectionView = [[CJFFormLRTag001TagCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
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
