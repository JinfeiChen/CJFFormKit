//
//  CJFFormTBNested001TableViewCell.m
//  Pods
//
//  Created by cjf on 16/12/2020.
//

#import "CJFFormTBNested001TableViewCell.h"

#define kCJFFormTBNested001SubTableViewCellHeight 35.0

@implementation CJFFormTBNested001SubModel

@end

@interface CJFFormTBNested001SubTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (strong, nonatomic) UIView *bgView; /**< <#property#> */
@property (strong, nonatomic) UILabel *arrowLabel; /**< <#property#> */
@property (strong, nonatomic) UIImageView *arrowImageView; /**< <#property#> */
@property (strong, nonatomic) UIButton *arrowButton; /**< <#property#> */
@property (strong, nonatomic) UIImageView *lineView; /**< <#property#> */
@property (strong, nonatomic) UITextField *textField; /**< <#property#> */
@property (strong, nonatomic) UIButton *deleteButton; /**< <#property#> */

@property (copy, nonatomic) void (^ didClickAtArrowButtonBlock)(UIButton *button); /**< <#property#> */
@property (copy, nonatomic) void (^ didClickAtDeleteButtonBlock)(UIButton *button); /**< <#property#> */
@property (copy, nonatomic) void (^ didTextFieldChangeBlock)(CJFFormTBNested001SubModel *model); /**< <#property#> */

@property (strong, nonatomic) CJFFormTBNested001SubModel *model; /**< <#property#> */

@end

@implementation CJFFormTBNested001SubTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildView];
    }
    return self;
}

- (void)buildView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];

    [self.contentView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kCJFFormTBNested001SubTableViewCellHeight, kCJFFormTBNested001SubTableViewCellHeight));
        make.centerY.right.mas_equalTo(self.contentView);
    }];

    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(5);
        make.left.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.deleteButton.mas_left).offset(-10);
        make.height.mas_equalTo(kCJFFormTBNested001SubTableViewCellHeight);
        make.bottom.mas_equalTo(self.contentView).offset(-5);
    }];

    [self.bgView addSubview:self.arrowLabel];
    [self.arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.bgView);
        make.left.mas_equalTo(self.bgView).offset(20);
        make.width.mas_lessThanOrEqualTo(80);
    }];

    [self.bgView addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.arrowLabel);
        make.left.mas_equalTo(self.arrowLabel.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(8, 5));
    }];

    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bgView);
        make.left.equalTo(self.arrowImageView.mas_right).offset(20);
        make.width.mas_equalTo(0.5);
    }];

    [self.bgView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.bgView);
        make.left.equalTo(self.lineView.mas_right).offset(0);
    }];

    [self.bgView addSubview:self.arrowButton];
    [self.arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self.bgView);
        make.right.mas_equalTo(self.textField.mas_left);
    }];
}

#pragma mark - Public Methods

#pragma mark - UITextFieldDelegate

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
//    self.textField.text = str;
//    self.model.text = str;
    
    // call back
//    if (self.didTextFieldChangeBlock) {
//        self.didTextFieldChangeBlock(textField);
//    }
//    return YES;
//}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%s, %@", __FUNCTION__, textField.text);
    self.model.text = textField.text;
    
    // call back
    if (self.didTextFieldChangeBlock) {
        self.didTextFieldChangeBlock(self.model);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    NSLog(@"%s, %ld, %@", __FUNCTION__, (long)reason, textField.text);
//    UITableView *tableView = (UITableView *)self.superview;
//    [tableView reloadData];
    self.model.text = textField.text;
    
    // call back
    if (self.didTextFieldChangeBlock) {
        self.didTextFieldChangeBlock(self.model);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.model.text = @"";
    
    // call back
    if (self.didTextFieldChangeBlock) {
        self.didTextFieldChangeBlock(self.model);
    }
    return YES;
}

#pragma mark - Actions

- (void)arrowButtonAction:(UIButton *)button
{
    if (self.didClickAtArrowButtonBlock) {
        self.didClickAtArrowButtonBlock(button);
    }
}

- (void)deleteButtonAction:(UIButton *)button
{
    if (self.didClickAtDeleteButtonBlock) {
        self.didClickAtDeleteButtonBlock(button);
    }
}

#pragma mark - Setters

- (void)setModel:(CJFFormTBNested001SubModel *)model
{
    _model = model;
    
    self.arrowLabel.text = [NSString stringWithFormat:@"%@", model.prefixText];
    self.textField.text = model.text;
    self.textField.placeholder = model.placeholder;
    
    [UIView animateWithDuration:0.3 animations:^{
        if (model.selected) {
            self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
        } else {
            self.arrowImageView.transform = CGAffineTransformIdentity;
        }
    }];
}

#pragma mark - Getters

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 8.0;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UILabel *)arrowLabel
{
    if (!_arrowLabel) {
        _arrowLabel = [[UILabel alloc] init];
        _arrowLabel.textColor = [UIColor grayColor];
        _arrowLabel.font = [UIFont systemFontOfSize:14];
        _arrowLabel.text = @"N/A";
    }
    return _arrowLabel;
}

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"search_down" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
    }
    return _arrowImageView;
}

- (UIButton *)arrowButton
{
    if (!_arrowButton) {
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(arrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor clearColor];
        _arrowButton = button;
    }
    return _arrowButton;
}

- (UIImageView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = HEXCOLOR(0xD6DCDF);
    }
    return _lineView;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"search_clean" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.cornerRadius = 17.5;
        button.layer.masksToBounds = YES;
        _deleteButton = button;
    }
    return _deleteButton;
}

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = HEXCOLOR(0x565465);
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 8;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.placeholder = @"Please input";

        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        leftView.backgroundColor = [UIColor whiteColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

@end

@implementation CJFFormTBNested001Model

@dynamic value;

- (instancetype)init
{
    if (self = [super init]) {
        _maxCount = 20;
    }
    return self;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{
        @"value" : [CJFFormTBNested001SubModel class]
    };
}

@end

@interface CJFFormTBNested001TableViewCell () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIButton *addButton; /**< <#property#> */
@property (strong, nonatomic) UITableView *listTableView; /**< <#property#> */
@property (strong, nonatomic) NSMutableArray *listArray; /**< <#property#> */

@end

@implementation CJFFormTBNested001TableViewCell

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
        make.height.mas_equalTo(18);
    }];

    [self.contentView addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.bottom.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.bottom);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(180);
    }];

    [self.contentView addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing - 5);
        make.left.mas_equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.bottom.mas_equalTo(self.addButton.mas_top).offset(-(self.cellStyle.spacing - 5));
        make.right.mas_equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
    }];

//    [self.model addObserver:self forKeyPath:@"prefixArray" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"currentIndexPath" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

#pragma mark - Observers

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context
{
    NSLog(@"observer: %@, %@, %@", object, keyPath, change);
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
    self.model = [CJFFormTBNested001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required ? @"* " : @"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
         NSFontAttributeName: [UIFont systemFontOfSize:16.0],
         NSForegroundColorAttributeName: [UIColor redColor]
     } range:self.model.required ? NSMakeRange(0, 1) : NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
    
    self.listArray = self.model.value.count < self.model.maxCount ? self.model.value : [[self.model.value subarrayWithRange:NSMakeRange(0, self.model.maxCount)] mutableCopy];

    [self.addButton setTitle:self.model.addButtonTitle ? : @"Click to add" forState:UIControlStateNormal];

    [self updateMyConstraints];

    [self.listTableView reloadData];
    [self layoutIfNeeded];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)updateMyConstraints
{
    [self.addButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo((self.listArray.count < self.model.maxCount) ? 40 : 0);
    }];

    [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.addButton.mas_bottom).offset((self.listArray.count > 0) ? (self.cellStyle.spacing - 5) : 0);
        make.bottom.mas_equalTo(self.addButton.mas_top).offset((self.listArray.count < self.model.maxCount) ? -(self.cellStyle.spacing - 5) : 0);
    }];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormTBNested001SubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CJFFormTBNested001SubTableViewCell class])];
    CJFFormTBNested001SubModel *subModel = self.listArray[indexPath.row];
    cell.model = subModel;
    // MARK: Action - NO.1 click at arrow button
    // 开发人员自行实现具体方法，并更新数据源
    cell.didClickAtArrowButtonBlock = ^(UIButton *button) {

        [self.listArray enumerateObjectsUsingBlock:^(CJFFormTBNested001SubModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.selected = NO;
        }];
        subModel.selected = YES;
        [tableView reloadData];
        
        if (self.customDidSelectedBlock) {
            self.customDidSelectedBlock(self, self.model, indexPath);
        }
    };
    // MARK: Action - NO.2 delete a subcell
    cell.didClickAtDeleteButtonBlock = ^(UIButton *button) {
        [self.listArray removeObjectAtIndex:indexPath.row];
        self.model.value = self.listArray;
        [self updateMyConstraints];
        [self.listTableView reloadData];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
        if (self.didUpdateFormModelBlock) {
            self.didUpdateFormModelBlock(self, self.model, nil);
        }
    };
    cell.didTextFieldChangeBlock = ^(CJFFormTBNested001SubModel *model) {
        NSLog(@"update: %@, row: %ld", [model yy_modelToJSONObject], indexPath.row);
        NSMutableArray *mArr = [NSMutableArray arrayWithArray:self.listArray];
        [mArr replaceObjectAtIndex:indexPath.row withObject:[model yy_modelToJSONObject]];
        self.model.value = mArr;
        [self updateMyConstraints];
        [self.listTableView reloadData];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
        if (self.didUpdateFormModelBlock) {
            self.didUpdateFormModelBlock(self, self.model, nil);
        }
    };
    return cell;
}

#pragma mark - UIView (UIConstraintBasedLayoutFittingSize)

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    self.listTableView.frame = CGRectMake(0, 0, targetSize.width, 44);
    [self.listTableView layoutIfNeeded];
    
    CGFloat subCellHeight = kCJFFormTBNested001SubTableViewCellHeight + 10;
    NSInteger count = self.listArray.count;
    CGFloat contentSizeHeight = subCellHeight * count;
    CGFloat titleHeight = 18;
    CGFloat buttonHeight = (self.listArray.count < self.model.maxCount) ? 40 : 0;
    CGFloat spacing = 2 * (self.cellStyle.spacing - 5);
    CGFloat contentViewHeight = contentSizeHeight + self.cellStyle.contentInset.top + self.cellStyle.contentInset.bottom + titleHeight + self.listTableView.contentInset.top + self.listTableView.contentInset.bottom + buttonHeight + spacing;
    return CGSizeMake(targetSize.width, contentViewHeight);
}

#pragma mark - Actions

- (void)addButtonAction:(UIButton *)button
{
    // MARK: Action - NO. 3 add new subcell
    if (self.listArray.count >= self.model.maxCount) {
        [self layoutIfNeeded];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        return;
    }
    
    if (!self.model.prefixArray || self.model.prefixArray.count == 0) {
        NSLog(@"数据缺失");
    }
    
    CJFFormTBNested001SubModel *new = [CJFFormTBNested001SubModel yy_modelWithDictionary:@{
        @"prefixText": self.model.prefixArray.firstObject ? : @"N/A",
        @"text": @"",
        @"placeholder": @"Please input"
    }];
    [self.listArray addObject:new];
    self.model.value = self.listArray;
    [self updateMyConstraints];
    [self.listTableView reloadData];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
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
        _listTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _listTableView.scrollEnabled = NO;
        _listTableView.sectionFooterHeight = 0;
        _listTableView.sectionHeaderHeight = 0;
        _listTableView.backgroundColor = [UIColor clearColor];

        [_listTableView registerClass:[CJFFormTBNested001SubTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CJFFormTBNested001SubTableViewCell class])];
    }
    return _listTableView;
}

- (UIButton *)addButton
{
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setImage:[UIImage imageNamed:@"ic_add_comment" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_addButton setTitle:@"Click to add" forState:UIControlStateNormal];
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
        _addButton.clipsToBounds = YES;
    }
    return _addButton;
}

- (NSMutableArray *)listArray
{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

@end
