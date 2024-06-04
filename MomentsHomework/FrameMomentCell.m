//
//  FrameMomentCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "FrameMomentCell.h"

@interface FrameMomentCell ()

@property (nonatomic, strong) NSArray<UIButton *> *buttons;

@property (nonatomic, strong) UILabel *nickNameLabel;

@property (nonatomic, strong) UILabel *contentLable;

@end

@implementation FrameMomentCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = UIColor.greenColor;
        
        [self initButtons];

        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.backgroundColor = [UIColor blueColor];
        _nickNameLabel.font = [UIFont systemFontOfSize:kMomentNickNameHeight];
        _nickNameLabel.frame = CGRectMake(0, 0, 4 * kMomentNickNameHeight, kMomentNickNameHeight);
        
        _contentLable = [[UILabel alloc] init];
        _contentLable.backgroundColor = [UIColor orangeColor];
        _contentLable.font = [UIFont systemFontOfSize:kMomentContentHeight];
        _contentLable.frame = CGRectMake(30, 30, 50 * kMomentContentHeight, kMomentContentHeight);
        
        [self.contentView addSubview:self.nickNameLabel];
        [self.contentView addSubview:self.contentLable];
    }
    return self;
}

- (void)initButtons {
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = UIColor.whiteColor;
        button.hidden = YES;
        button.layer.borderWidth = 1;

        CGFloat buttonX = i % 3 * kMomentImageWidth;
        CGFloat buttonY = floor(i / 3.0) * kMomentImageHeight;
        button.frame = CGRectMake(buttonX + kMomentSpeceToLeft,
                                  buttonY + kMomentNickNameHeight +kMomentContentHeight + 20,
                                  kMomentImageWidth, kMomentImageHeight);
        [self.contentView addSubview:button];
        [buttons addObject:button];
    }
    _buttons = [buttons copy];
}

#pragma mark -MomentCellModelUpdateable

- (void)updateCellModel:(MomentCellModel *)cellModel {
    _nickNameLabel.text = cellModel.nickNameLable;

    _contentLable.text = cellModel.contentLable;

    for (int i = 0; i < 9; i++) {
        if (i >= self.buttons.count) {
            NSAssert(NO, @"check updateCellModel");
            return;
        }
        UIButton *button = self.buttons[i];
        if (i < cellModel.images.count) {
            button.hidden = NO;
            [button setBackgroundImage:cellModel.images[i] forState:UIControlStateNormal];
        } else {
            button.hidden = YES;
        }
    }
}

@end
