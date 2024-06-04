//
//  MomentCellModel.h
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat const kMomentImageWidth;
FOUNDATION_EXPORT CGFloat const kMomentImageHeight;
FOUNDATION_EXPORT CGFloat const kMomentNickNameHeight;
FOUNDATION_EXPORT CGFloat const kMomentContentHeight;
FOUNDATION_EXPORT CGFloat const kMomentSpaceBetweenTopAndBottom;
FOUNDATION_EXPORT CGFloat const kMomentSpeceToLeft;

@class MomentCellModel;

/// 更新使用朋友圈模型的视图的数据
@protocol MomentCellModelUpdateable <NSObject>

- (void)updateCellModel:(MomentCellModel *)cellModel;

@end

///朋友圈模型，包含一条朋友圈的数据
@interface MomentCellModel : NSObject
/// 展示的图片
@property (nonatomic, copy, readonly) NSArray<UIImage *> *images;
/// 用户名
@property (nonatomic, copy, readonly) NSString *nickNameLable;
/// 一段文章
@property (nonatomic, copy, readonly) NSString *contentLable;

///静态布局下返回UItableViewCell高度
- (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
