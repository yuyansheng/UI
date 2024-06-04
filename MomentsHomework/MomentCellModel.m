//
//  MomentCellModel.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "MomentCellModel.h"

CGFloat const kMomentImageWidth = 100;
CGFloat const kMomentImageHeight = 100;
CGFloat const kMomentNickNameHeight = 20;
CGFloat const kMomentSpaceBetweenTopAndBottom = 10;
CGFloat const kMomentContentHeight = 15;
CGFloat const kMomentSpeceToLeft = 50;

@implementation MomentCellModel

- (instancetype)init {
    if (self = [super init]) {
        NSInteger imageCount = random() % 9 + 1;
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 0; i < imageCount; i++) {
            [images addObject:[self createImageWithColor:UIColor.redColor imageSize:CGSizeMake(kMomentImageWidth, kMomentImageHeight)]];
        }
        _images = [images copy];
        _nickNameLable = @"用户名";
        _contentLable = @"这是一段文章sdsadsafsdfasdfasfsadfasdfsafasdfasdfsadfasdfdasfasfsa1";
    }

    return self;
}

#pragma mark - public

- (CGFloat)cellHeight {
    return ceil(self.images.count / 3.f) * kMomentImageHeight + kMomentNickNameHeight * 2 + kMomentSpaceBetweenTopAndBottom * 3;
}

#pragma mark - Private

- (UIImage *)createImageWithColor:(UIColor *)color imageSize:(CGSize)size {
    CGRect tempRect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContext(tempRect.size);
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(imageContext, [color CGColor]);
    CGContextFillRect(imageContext, tempRect);
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}

@end
