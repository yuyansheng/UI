//
//  MomentCellModel.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "MomentCellModel.h"

CGFloat const cellImageWidth = 100;
CGFloat const cellImageHeight = 100;
CGFloat const cellTextHeight = 100;

@interface MomentCellModel ()

@end

@implementation MomentCellModel

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        int imageCount = random() % 9 + 1;
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 0; i < imageCount; i ++){
            [images addObject:[self createImageWithColor:UIColor.redColor imageSize:CGSizeMake(cellImageWidth, cellImageHeight)]];
        }
        _images = [images copy];
    }
    
    return self;
}

- (CGFloat)cellHeight{
    return ceil(self.images.count / 3.0 * cellImageHeight);
}

//通过颜色创建一个矩形
- (UIImage *)createImageWithColor:(UIColor *)color imageSize:(CGSize)size{
    CGRect tempRect = CGRectMake(0.0, 0.0, size.width, size.height);
    //创建一个图片上下文
    UIGraphicsBeginImageContext(tempRect.size);
    //得到图片上下文
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    //
    CGContextSetFillColorWithColor(imageContext, [color CGColor]);
    CGContextFillRect(imageContext, tempRect);
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}

@end
