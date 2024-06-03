//
//  MomentCellModel.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "MomentCellModel.h"

CGFloat const MomentImageWidth = 100;
CGFloat const MomentImageHeight = 100;
CGFloat const MomentTextHeight = 20;
CGFloat const MomentSpaceBetweenTopAndBottom = 10;
CGFloat const MomentSpeceToLeft = 50;


@interface MomentCellModel ()

@end

@implementation MomentCellModel

- (instancetype)init{
    self = [super init];
    
    if(self){
        int imageCount = random() % 9 + 1;
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 0; i < imageCount; i ++){
            [images addObject:[self mp_createImageWithColor:UIColor.redColor imageSize:CGSizeMake(MomentImageWidth, MomentImageHeight)]];
        }
        _images = [images copy];
        _userName = @"用户名";
        _userText = @"这是一段文章sdsadsafsdfasdfasfsadfasdfsafasdfasdfsadfasdfdasfasfsa1";
    }
    
    return self;
}

#pragma mark - public
- (CGFloat)cellHeight{
    return ceil(self.images.count / 3.f ) * MomentImageHeight + MomentTextHeight * 2 + MomentSpaceBetweenTopAndBottom * 3;
}

#pragma mark - Private
- (UIImage *)mp_createImageWithColor:(UIColor *)color imageSize:(CGSize)size{
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
