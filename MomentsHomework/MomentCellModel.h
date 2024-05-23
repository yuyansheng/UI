//
//  MomentCellModel.h
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat const cellImageWidth;
FOUNDATION_EXPORT CGFloat const cellImageHeight;
FOUNDATION_EXPORT CGFloat const cellTextHeight;

@class MomentCellModel;

@protocol MomentCellModelUpdateable <NSObject>

- (void)updateCellModel:(MomentCellModel *)cellModel;

@end

@interface MomentCellModel : NSObject

@property (nonatomic, copy ,readonly) NSArray <UIImage *> *images;

@property (nonatomic, copy ,readonly) NSString *userName;

@property (nonatomic, copy ,readonly) NSString *userText;

- (CGFloat)cellHeight;

@end


NS_ASSUME_NONNULL_END
