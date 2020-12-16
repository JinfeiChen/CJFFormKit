//
//  CJFFormTBFileUpload001TableViewCell.m
//  Pods
//
//  Created by cjf on 15/12/2020.
//

#import "CJFFormTBFileUpload001TableViewCell.h"

#define kFormTBFileRowHeight 35.0

@interface CJFFormTBFileTableViewCell : UITableViewCell

@property (strong, nonatomic) UIButton *deleteBtn; /**< <#property#> */
@property (strong, nonatomic) UIImageView *iconImgView; /**< <#property#> */
@property (strong, nonatomic) UILabel *myTitleLabel; /**< <#property#> */
@property (copy, nonatomic) void(^deleteBlock)(UIButton *button); /**< <#property#> */

@end

@implementation CJFFormTBFileTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (void)buildView
{
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(12);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kFormTBFileRowHeight/4, kFormTBFileRowHeight/3));
    }];
    
    [self.contentView addSubview:self.deleteBtn];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kFormTBFileRowHeight, kFormTBFileRowHeight));
    }];
    
    [self.contentView addSubview:self.myTitleLabel];
    [self.myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.iconImgView.mas_right).offset(10);
        make.right.mas_equalTo(self.deleteBtn.mas_left).offset(-10);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat imgW = 12;
    CGFloat imgH = 15;
    CGFloat padding = (kFormTBFileRowHeight - imgH) / 2;
    CGRect frame = self.imageView.frame;
    self.imageView.frame = CGRectMake(CGRectGetMinX(frame), padding, imgW, imgH);
}

#pragma mark - Actions

- (void)deleteBtnAction:(UIButton *)button
{
    if (self.deleteBlock) {
        self.deleteBlock(button);
    }
}

#pragma mark - Getters

- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconImgView;
}

- (UILabel *)myTitleLabel
{
    if (!_myTitleLabel) {
        _myTitleLabel = [[UILabel alloc] init];
        _myTitleLabel.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular];
        _myTitleLabel.textColor = [UIColor grayColor];
    }
    return _myTitleLabel;
}

- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"search_close_tag" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(deleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}

@end

@implementation CJFFormTBFileUpload001Model

@dynamic value;

@end

@interface CJFFormTBFileUpload001TableViewCell () <UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _margin;
}

@property (strong, nonatomic) UIButton *addButton; /**< <#property#> */
@property (strong, nonatomic) UITableView *listTableView; /**< <#property#> */

@end

@implementation CJFFormTBFileUpload001TableViewCell

@dynamic model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _margin = 10;
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
    
    [self.contentView addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(180);
    }];
    
    [self.contentView addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addButton.mas_bottom).offset(self.cellStyle.spacing);
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
    self.model = [CJFFormTBFileUpload001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
    
    [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addButton.mas_bottom).offset((self.model.value.count > 0)?self.cellStyle.spacing:0);
    }];
    
    [self.listTableView reloadData];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.value.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormTBFileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([CJFFormTBFileTableViewCell class])];
    cell.iconImgView.image = [UIImage imageNamed:@"img_files" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
    cell.myTitleLabel.text = [NSString stringWithFormat:@"%@", self.model.value[indexPath.row]];
    cell.deleteBlock = ^(UIButton *button) {
        if (self.testBlock) {
            self.testBlock(indexPath);
        }
    };
    return cell;
}

#pragma mark - UIView (UIConstraintBasedLayoutFittingSize)

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    CGFloat contentViewHeight = kFormTBFileRowHeight * self.model.value.count + self.cellStyle.contentInset.top + self.cellStyle.contentInset.bottom + 18 + self.listTableView.contentInset.top + self.listTableView.contentInset.bottom + 10 * ((self.model.value.count>0)?2:1) + 40;
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, contentViewHeight);
}

#pragma mark - Actions

- (void)addButtonAction:(UIButton *)button
{
    if (self.customDidSelectedBlock) {
        self.customDidSelectedBlock(self, self.model, nil);
    }
}

#pragma mark - Getters

- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.layer.cornerRadius = 8.0;
        _listTableView.layer.masksToBounds = YES;
        _listTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _listTableView.scrollEnabled = NO;
        _listTableView.sectionFooterHeight = 0;
        _listTableView.sectionHeaderHeight = 0;
        _listTableView.rowHeight = kFormTBFileRowHeight;
        [_listTableView registerClass:[CJFFormTBFileTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBFileTableViewCell class])];
    }
    return _listTableView;
}

- (UIButton *)addButton
{
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setImage:[UIImage imageNamed:@"ic_add_comment" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_addButton setTitle:@"Click to upload" forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_addButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
        UIEdgeInsets edge = _addButton.titleEdgeInsets;
        edge.left = 12.0;
        _addButton.titleEdgeInsets = edge;
        _addButton.layer.cornerRadius = 8.0;
//        _addButton.layer.borderWidth = 1.0;
//        _addButton.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
        [_addButton setBackgroundColor:[UIColor whiteColor]];
    }
    return _addButton;
}

@end
