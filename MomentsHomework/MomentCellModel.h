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


@interface MomentCellModel : NSObject

@property (nonatomic, copy ,readonly) NSArray <UIImage *> *images;

- (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
