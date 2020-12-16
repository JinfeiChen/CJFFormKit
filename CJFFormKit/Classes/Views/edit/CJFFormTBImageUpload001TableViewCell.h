//
//  CJFFormTBImageUpload001TableViewCell.h
//  Pods
//  表单控件：图片上传
//
//  Created by cjf on 10/12/2020.
//

#import <CJFFormKit/CJFFormTBTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFFormTBImageUpload001CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, strong) UILabel *gifLable;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, strong) id asset;

- (UIView *)snapshotView;

@end

@interface CJFFormTBImageUpload001Model : CJFFormModel

@property (strong, nonatomic) NSArray *value; /**< <#property#> */

@property (assign, nonatomic) NSInteger maxPhotos; /**< 照片最大可选张数，设置为1即为单选模式，默认 20 */
@property (assign, nonatomic) NSInteger rowPhotos; /**< 每行展示照片张数，默认 4 */
@property (assign, nonatomic) BOOL allowPickingMuitlpleVideo; /**< 是否可以多选视频 默认 YES */
@property (assign, nonatomic) BOOL allowPickingVideo; /**< 是否允许选择视频 默认 YES */
@property (assign, nonatomic) BOOL allowPickingImage; /**< 是否允许选择图片 默认 YES */
@property (assign, nonatomic) BOOL allowPickingGif; /**< 是否允许选择动图 默认 YES */
@property (assign, nonatomic) BOOL allowPickingOriginalPhoto; /**< 是否允许选择原图 默认 YES */
@property (assign, nonatomic) BOOL allowCrop; /**< 单选模式下是否允许裁剪 默认 NO */
@property (assign, nonatomic) BOOL needCircleCrop; /**< 是否使用圆形裁剪框 默认 NO */
@property (assign, nonatomic) BOOL showTakePhotoBtn; /**< 是否允许拍照 默认 YES */
@property (assign, nonatomic) BOOL showTakeVideoBtn; /**< 是否允许拍视频 默认 YES */
@property (assign, nonatomic) BOOL showSelectedIndex; /**< 是否显示图片右上角选中序号 默认 YES */
@property (assign, nonatomic) BOOL showSheet; /**< 是否显示一个sheet，把拍照/拍视频按钮放在外面 默认 YES */

@end

@interface CJFFormTBImageUpload001TableViewCell : CJFFormTBTableViewCell

@property (strong, nonatomic) CJFFormTBImageUpload001Model *model; /**< <#property#> */

@end

NS_ASSUME_NONNULL_END
