//
//  CJFFormTBImageUpload001TableViewCell.m
//  Pods
//
//  Created by cjf on 10/12/2020.
//

#import "CJFFormTBImageUpload001TableViewCell.h"

#import <TZImagePickerController/TZImagePickerController.h>
#import <TZImagePickerController/UIView+TZLayout.h>
#import <TZImagePickerController/TZImageManager.h>
#import <TZImagePickerController/TZVideoPlayerController.h>
#import <TZImagePickerController/TZPhotoPreviewController.h>
#import <TZImagePickerController/TZGifPhotoPreviewController.h>
#import <TZImagePickerController/TZLocationManager.h>
#import <TZImagePickerController/TZAssetCell.h>
#import <TZImagePreviewController/TZImagePreviewController.h>

#import <CJFFormKit/UIView+ext.h>
#import <CJFFormKit/FLAnimatedImage.h>
#import <Photos/Photos.h>
//#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreServices/CoreServices.h>

@implementation CJFFormTBImageUpload001CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];

        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        self.clipsToBounds = YES;

        _videoImageView = [[UIImageView alloc] init];
        _videoImageView.image = [UIImage tz_imageNamedFromMyBundle:@"MMVideoPreviewPlay"];
        _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _videoImageView.hidden = YES;
        [self addSubview:_videoImageView];

        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"photo_delete" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -10);
        _deleteBtn.alpha = 0.6;
        [self addSubview:_deleteBtn];

        _gifLable = [[UILabel alloc] init];
        _gifLable.text = @"GIF";
        _gifLable.textColor = [UIColor whiteColor];
        _gifLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        _gifLable.textAlignment = NSTextAlignmentCenter;
        _gifLable.font = [UIFont systemFontOfSize:10];
        [self addSubview:_gifLable];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _gifLable.frame = CGRectMake(self.tz_width - 25, self.tz_height - 14, 25, 14);
    _deleteBtn.frame = CGRectMake(self.tz_width - 36, 0, 36, 36);
    CGFloat width = self.tz_width / 3.0;
    _videoImageView.frame = CGRectMake(width, width, width, width);
    [self bringSubviewToFront:_videoImageView];
    _playerLayer.frame = self.bounds;
}

- (void)setAsset:(PHAsset *)asset {
    _asset = asset;
    if ([asset isKindOfClass:[PHAsset class]]) {
        _videoImageView.hidden = asset.mediaType != PHAssetMediaTypeVideo;
        _gifLable.hidden = ![[asset valueForKey:@"filename"] containsString:@"GIF"];
    } else {
        if ([asset isKindOfClass:[NSURL class]]) {
            NSURL *URL = (NSURL *)asset;
            _gifLable.hidden = ![URL.absoluteString.lowercaseString hasSuffix:@"gif"];
        } else {
            _gifLable.hidden = YES;
        }
    }
    [self configMoviePlayer];
}

- (void)setVideoURL:(NSURL *)videoURL {
    _videoURL = videoURL;
    [self configMoviePlayer];
}

- (void)configMoviePlayer {
    if (_player) {
        [_playerLayer removeFromSuperlayer];
        _playerLayer = nil;
        [_player pause];
        _player = nil;
    }

    self.videoImageView.hidden = !self.videoURL;
    if (self.videoURL) {
        // 这个处理比较耗内存，最好是只用UIImageView显示视频的封面(服务端返回)，不创建AVPlayer
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:self.videoURL];
        self.player = [AVPlayer playerWithPlayerItem:playerItem];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.backgroundColor = [UIColor blackColor].CGColor;
        self.playerLayer.frame = self.bounds;
        [self.layer addSublayer:self.playerLayer];
        // 如cell内也需要播放视频，打开下面的注释即可，需注意会导致内存升高。同时需监听播放结束、应用回到后台的通知，将播放重置到起点或暂停，参考TZVideoPreviewCell内的处理
        // [self.player play];
        // self.videoImageView.hidden = YES;
    }
}

- (void)setRow:(NSInteger)row {
    _row = row;
    _deleteBtn.tag = row;
}

- (UIView *)snapshotView {
    UIView *snapshotView = [[UIView alloc]init];

    UIView *cellSnapshotView = nil;

    if ([self respondsToSelector:@selector(snapshotViewAfterScreenUpdates:)]) {
        cellSnapshotView = [self snapshotViewAfterScreenUpdates:NO];
    } else {
        CGSize size = CGSizeMake(self.bounds.size.width + 20, self.bounds.size.height + 20);
        UIGraphicsBeginImageContextWithOptions(size, self.opaque, 0);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *cellSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        cellSnapshotView = [[UIImageView alloc]initWithImage:cellSnapshotImage];
    }

    snapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    cellSnapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);

    [snapshotView addSubview:cellSnapshotView];
    return snapshotView;
}

@end

@implementation CJFFormTBImageUpload001Model

@dynamic value;

- (instancetype)init
{
    if (self = [super init]) {
        _maxPhotos = 20;
        _rowPhotos = 4;
//        _allowPickingMuitlpleVideo = NO;
//        _allowPickingVideo = NO;
        _allowPickingImage = YES;
        _allowPickingGif = NO;
        _allowPickingOriginalPhoto = YES;
//        _allowCrop = NO;
//        _needCircleCrop = NO;
        _showTakePhotoBtn = YES;
//        _showTakeVideoBtn = NO;
        _showSelectedIndex = YES;
        _showSheet = YES;
    }
    return self;
}

@end

@interface CJFFormTBImageUpload001TableViewCell () <TZImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    CGFloat _itemWH;
    CGFloat _margin;
}

@property (assign, nonatomic) BOOL isSelectOriginalPhoto; /**< <#property#> */
@property (strong, nonatomic) NSMutableArray *selectedPhotos; /**< <#property#> */

@property (strong, nonatomic) UICollectionView *collectionView; /**< <#property#> */
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout; /**< <#property#> */

@property (nonatomic, strong) NSArray *videoSuffixs;

@end

@implementation CJFFormTBImageUpload001TableViewCell

@dynamic model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.videoSuffixs = @[@"mov", @"mp4", @"rmvb", @"rm", @"flv", @"avi", @"3gp", @"wmv", @"mpeg1", @"mpeg2", @"mpeg4(mp4)",                                 @"asf", @"swf", @"vob", @"dat", @"m4v", @"f4v", @"mkv", @"mts", @"ts"];
        _selectedPhotos = [NSMutableArray array];
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

    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    NSString *title = [NSString stringWithFormat:@"%@%@", self.model.required ? @"* " : @"", self.model.title];
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [mAttr addAttributes:@{
         NSFontAttributeName: [UIFont systemFontOfSize:16.0],
         NSForegroundColorAttributeName: [UIColor redColor]
     } range:self.model.required ? NSMakeRange(0, 1) : NSMakeRange(0, 0)];
    self.TTitleLabel.attributedText = mAttr;

    // MARK: update _selectedPhotos
    _selectedPhotos = [NSMutableArray array];
    [self.model.value enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [_selectedPhotos addObject:[NSURL URLWithString:obj]];
    }];

//    self.collectionView.userInteractionEnabled = self.model.isEditable;
    self.collectionView.backgroundColor = self.model.isEditable ? [UIColor whiteColor] : [UIColor colorWithWhite:0.95 alpha:1.0];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate/UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_selectedPhotos.count >= self.model.maxPhotos) {
        return _selectedPhotos.count;
    }
    return self.model.editable ? _selectedPhotos.count + 1 : _selectedPhotos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJFFormTBImageUpload001CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CJFFormTBImageUpload001CollectionViewCell class]) forIndexPath:indexPath];
    cell.videoImageView.hidden = YES;
    cell.videoURL = nil;
    cell.imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
    if (indexPath.item == _selectedPhotos.count) {
        cell.imageView.image = nil;
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn.png" inBundle:kCJFFormResourceBundle compatibleWithTraitCollection:nil];
        cell.deleteBtn.hidden = YES;
        cell.gifLable.hidden = YES;
    } else {
        id photo = _selectedPhotos[indexPath.item];
        if ([photo isKindOfClass:[UIImage class]]) {
            cell.imageView.image = photo;
        } else if ([photo isKindOfClass:[NSURL class]]) {
            NSURL *URL = (NSURL *)photo;
            NSString *suffix = [[URL.absoluteString.lowercaseString componentsSeparatedByString:@"."] lastObject];
            if (suffix && [self.videoSuffixs containsObject:suffix]) {
                cell.videoURL = URL;
            } else {
                [self configImageView:cell.imageView URL:(NSURL *)photo completion:nil];
            }
        } else if ([photo isKindOfClass:[PHAsset class]]) {
            [[TZImageManager manager] getPhotoWithAsset:photo photoWidth:100 completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                NSLog(@"info: %@", info);
                cell.imageView.image = photo;
            }];
        }
        cell.asset = _selectedPhotos[indexPath.item];
        cell.deleteBtn.hidden = !self.model.isEditable;
    }
    cell.deleteBtn.tag = indexPath.item;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteBtn.enabled = self.model.isEditable;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == _selectedPhotos.count) {
        TZImagePickerController *imagePickerVc = [self createTZImagePickerController];
        imagePickerVc.isSelectOriginalPhoto = NO;
        [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto, NSArray<NSDictionary *> *infos) {
//            NSLog(@"photos: %@, assets: %@, info: %@", photos, assets, infos);
//            [self.selectedPhotos addObjectsFromArray:assets];
//            [self.collectionView reloadData];
//            [self.tableView beginUpdates];
//            [self.tableView endUpdates];
            
            if (self.didUpdateFormModelBlock) {
                self.didUpdateFormModelBlock(self, self.model, photos);
            }
        }];
        [[self viewController] presentViewController:imagePickerVc animated:YES completion:nil];
    } else { // preview photos or video / 预览照片或者视频
        TZImagePickerController *imagePickerVc = [self createTZImagePickerController];
        imagePickerVc.maxImagesCount = 1;
        imagePickerVc.showSelectBtn = NO;
        [imagePickerVc setPhotoPreviewPageDidLayoutSubviewsBlock:^(UICollectionView *collectionView, UIView *naviBar, UIButton *backButton, UIButton *selectButton, UILabel *indexLabel, UIView *toolBar, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel) {
            if (numberLabel) {
                [numberLabel removeFromSuperview];
                numberLabel = nil;
            }
            if (numberImageView) {
                [numberImageView removeFromSuperview];
                numberImageView = nil;
            }
            if (doneButton) {
                [doneButton removeFromSuperview];
                doneButton = nil;
            }
        }];
        TZImagePreviewController *previewVc = [[TZImagePreviewController alloc] initWithPhotos:_selectedPhotos currentIndex:indexPath.row tzImagePickerVc:imagePickerVc];
        [previewVc setBackButtonClickBlock:^(BOOL isSelectOriginalPhoto) {
            self.isSelectOriginalPhoto = isSelectOriginalPhoto;
            NSLog(@"预览页 返回 isSelectOriginalPhoto:%d", isSelectOriginalPhoto);
        }];
        [previewVc setSetImageWithURLBlock:^(NSURL *URL, UIImageView *imageView, void (^completion)(void)) {
            [self configImageView:imageView URL:URL completion:completion];
        }];
        [previewVc setDoneButtonClickBlock:^(NSArray *photos, BOOL isSelectOriginalPhoto) {
            self.isSelectOriginalPhoto = isSelectOriginalPhoto;
            self.selectedPhotos = [NSMutableArray arrayWithArray:photos];
            NSLog(@"预览页 完成 isSelectOriginalPhoto:%d photos.count:%zd", isSelectOriginalPhoto, photos.count);
            [self.collectionView reloadData];
        }];
        [[self viewController] presentViewController:previewVc animated:YES completion:nil];
    }
}

- (TZImagePickerController *)createTZImagePickerController {
    [TZImageManager manager].isPreviewNetworkImage = YES;
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:NO];

#pragma mark - 个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;

    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    // imagePickerVc.navigationBar.translucent = NO;
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];

    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = YES;
    imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.allowPickingMultipleVideo = YES;

    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;

    imagePickerVc.showSelectBtn = NO;
    //imagePickerVc.allowPreview = NO;
    // imagePickerVc.preferredLanguage = @"zh-Hans";

#pragma mark - 到这里为止

    return imagePickerVc;
}

#pragma mark - UIView (UIConstraintBasedLayoutFittingSize)

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    // 先对bgview进行布局,这里需对bgView布局后collectionView宽度才会准确
//    self.bgView.frame = CGRectMake(0, 0, targetSize.width, 44);
//    [self.bgView layoutIfNeeded];

    // 在对collectionView进行布局
    _margin = 10;
    _itemWH = (targetSize.width - self.cellStyle.contentInset.left - self.cellStyle.contentInset.right - (self.model.rowPhotos - 1) * _margin - 2 * _margin) / self.model.rowPhotos;
    self.flowLayout.itemSize = CGSizeMake(_itemWH, _itemWH);
//    self.collectionView.frame = CGRectMake(0, 0, targetSize.width - self.cellStyle.contentInset.left - self.cellStyle.contentInset.right, 44);
    [self.collectionView layoutIfNeeded];

    // 由于这里collection的高度是动态的，这里cell的高度我们根据collection来计算
    CGSize collectionSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat contentViewHeight = collectionSize.height + self.cellStyle.contentInset.top + self.cellStyle.contentInset.bottom + 18 + self.collectionView.contentInset.top + self.collectionView.contentInset.bottom + 10;
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, contentViewHeight);
}

#pragma mark - Private Methods

- (void)configImageView:(UIImageView *)imageView URL:(NSURL *)URL completion:(void (^)(void))completion {
    if ([URL.absoluteString.lowercaseString hasSuffix:@"gif"]) {
//        // 先显示静态图占位
//        [[SDWebImageManager sharedManager] loadImageWithURL:URL options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
//            if (!imageView.image) {
//                imageView.image = image;
//            }
//        }];
//        // 动图加载完再覆盖掉
//        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:URL options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
//            imageView.image = [UIImage sd_animatedGIFWithData:data];
//            if (completion) {
//                completion();
//            }
//        }];
        [[YYWebImageManager sharedManager] requestImageWithURL:URL options:YYWebImageOptionProgressive progress:nil transform:nil completion:^(UIImage *_Nullable image, NSURL *_Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError *_Nullable error) {
            imageView.image = image;
            if (completion) {
                completion();
            }
        }];
    } else {
//        [imageView sd_setImageWithURL:URL completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            if (completion) {
//                completion();
//            }
//        }];
        [imageView yy_setImageWithURL:URL placeholder:nil options:YYWebImageOptionProgressive completion:^(UIImage *_Nullable image, NSURL *_Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError *_Nullable error) {
            if (completion) {
                completion();
            }
        }];
    }
}

#pragma mark - Actions

- (void)deleteBtnClik:(UIButton *)sender {
    if ([self collectionView:self.collectionView numberOfItemsInSection:0] <= _selectedPhotos.count) { // 没有+号按钮的时候
        [_selectedPhotos removeObjectAtIndex:sender.tag];
        NSMutableArray *mArr = [NSMutableArray arrayWithArray:self.model.value];
        [mArr removeObjectAtIndex:sender.tag];
        self.model.value = mArr;
        NSLog(@"%@", self.selectedPhotos);
        [self.collectionView reloadData];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
        if (self.didUpdateFormModelBlock) {
            self.didUpdateFormModelBlock(self, self.model, nil);
        }
        
        return;
    }
    
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:self.model.value];
    [mArr removeObjectAtIndex:sender.tag];
    self.model.value = mArr;
    NSLog(@"%@", self.selectedPhotos);
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self.collectionView reloadData];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
        if (self.didUpdateFormModelBlock) {
            self.didUpdateFormModelBlock(self, self.model, nil);
        }
        
    }];
}

#pragma mark - Getters

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.layer.cornerRadius = 8.0;
        _collectionView.layer.masksToBounds = YES;
        _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _collectionView.scrollEnabled = NO;

        [_collectionView registerClass:[CJFFormTBImageUpload001CollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CJFFormTBImageUpload001CollectionViewCell class])];
    }
    return _collectionView;
}

@end
