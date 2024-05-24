//
//  MomentCollectionViewCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/24.
//

#import "MomentCollectionViewCell.h"

@interface MomentCollectionViewCell ()

@property (nonatomic, strong) UIButton *button;

@end


@implementation MomentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.button.layer.borderWidth = 1;
        self.button = [[UIButton alloc] init];
        self.button.hidden = YES;
        self.button.backgroundColor = UIColor.whiteColor;
        self.button.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.button];
        [NSLayoutConstraint activateConstraints:@[
        [self.button.widthAnchor constraintEqualToConstant:100],
        [self.button.heightAnchor constraintEqualToConstant:100]
        ]];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.button.hidden = YES;
}

- (void)updateCellModelByImage:(UIImage *)image{
    self.button.hidden = NO;
    //NSLog(@"333333");
    [self.button setBackgroundImage:image forState:UIControlStateNormal];
}
@end
