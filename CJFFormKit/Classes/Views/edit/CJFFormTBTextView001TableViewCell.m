//
//  CJFFormTBTextView001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBTextView001TableViewCell.h"

@implementation CJFFormTBTextView001Model

@end

@interface CJFFormTBTextView001TableViewCell () <YYTextViewDelegate> 

@property (nonatomic, strong) YYTextView *textView;

@end

@implementation CJFFormTBTextView001TableViewCell

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
    
    [self.contentView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.TTitleLabel.mas_bottom).offset(self.cellStyle.spacing);
        make.left.equalTo(self.contentView).offset(self.cellStyle.contentInset.left);
        make.right.equalTo(self.contentView).offset(-self.cellStyle.contentInset.right);
        make.height.mas_equalTo(80);
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
    self.model = [CJFFormTBTextView001Model yy_modelWithJSON:mDict];
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required?@"* ":@"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:16.0],
        NSForegroundColorAttributeName: [UIColor redColor]
    } range:self.model.required?NSMakeRange(0, 1):NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;
    
    self.textView.placeholderText = self.model.placeholder;
    self.textView.text = self.model.value;
    
    self.textView.editable = self.model.isEditable;
    self.textView.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
}

#pragma mark - YYTextViewDelegate

- (void)textViewDidEndEditing:(YYTextView *)textView {
    NSLog(@"===>%@",textView.text);
    self.model.value = textView.text;
    
    // call back
    if (self.didUpdateFormModelBlock) {
        self.didUpdateFormModelBlock(self, self.model, nil);
    }
}

- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - Getters

- (YYTextView *)textView {
    if (_textView == nil) {
        _textView = [[YYTextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.textColor = HEXCOLOR(0x565465);
        _textView.layer.masksToBounds = YES;
        _textView.layer.cornerRadius  = 8;
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.delegate = self;
    }
    return _textView;
}

@end
