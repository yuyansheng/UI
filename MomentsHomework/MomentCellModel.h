//
//  MomentCellModel.h
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


FOUNDATION_EXPORT CGFloat const MomentImageWidth;
FOUNDATION_EXPORT CGFloat const MomentImageHeight;
FOUNDATION_EXPORT CGFloat const MomentTextHeight;
FOUNDATION_EXPORT CGFloat const MomentSpaceBetweenTopAndBottom;
FOUNDATION_EXPORT CGFloat const MomentSpeceToLeft;

@class MomentCellModel;

@protocol MomentCellModelUpdateable <NSObject>

- (void)updateCellModel:(MomentCellModel *)cellModel;

@end

@interface MomentCellModel : NSObject
//展示的图片
@property (nonatomic, copy ,readonly) NSArray <UIImage *> *images;
//用户名
@property (nonatomic, copy ,readonly) NSString *userName;
//一段文章
@property (nonatomic, copy ,readonly) NSString *userText;

/**
静态布局下返回UITableViewCell高度
 */
- (CGFloat)cellHeight;

@end


NS_ASSUME_NONNULL_END
