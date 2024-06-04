//
//  AutoLayoutMomentCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/23.
//

#import "AutoLayoutMomentCell.h"

@interface AutoLayoutMomentCell () {
    /// contentView的底部约束
    NSLayoutConstraint *_contentViewBottomConstraint;
}
/// 按钮数组
@property (nonatomic, copy) NSArray<UIButton *> *buttons;
/// 用户名
@property (nonatomic, strong) UILabel *nickNameLable;
/// 一段文字
@property (nonatomic, strong) UILabel *contentLable;

@end

@implementation AutoLayoutMomentCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = UIColor.greenColor;

        [self initnickNameLable];
        [self initcontentLable];
        [self initButtons];
    }
    return self;
}

- (void)initButtons {
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        button.backgroundColor = UIColor.whiteColor;
        button.hidden = YES;
        button.layer.borderWidth = 1;
        [button addTarget:self action:@selector(testButton) forControlEvents:UIControlEventTouchUpInside];

        CGFloat buttonX = i % 3 * kMomentImageWidth;
        CGFloat buttonY = floor(i / 3.0) * kMomentImageHeight;
        [self.contentView addSubview:button];

        NSLayoutConstraint *buttonTop = [button.topAnchor constraintEqualToAnchor:_contentLable.bottomAnchor
                                                                         constant:kMomentSpaceBetweenTopAndBottom + buttonY];
        buttonTop.priority = UILayoutPriorityDefaultLow;
        [NSLayoutConstraint activateConstraints:@[
            buttonTop, [button.heightAnchor constraintEqualToConstant:kMomentImageHeight],
            [button.widthAnchor constraintEqualToConstant:kMomentImageWidth],
            [button.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:kMomentSpeceToLeft + buttonX]
        ]];

        [buttons addObject:button];
    }
    _buttons = [buttons copy];
}

- (void)initnickNameLable {
    _nickNameLable = _nickNameLable = [[UILabel alloc] init];
    _nickNameLable.backgroundColor = [UIColor blueColor];
    _nickNameLable.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:_nickNameLable];

    [NSLayoutConstraint activateConstraints:@[
        [_nickNameLable.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:1],
        [_nickNameLable.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:1]
    ]];
}

- (void)initcontentLable {
    _contentLable = [[UILabel alloc] init];
    _contentLable.backgroundColor = [UIColor orangeColor];
    _contentLable.translatesAutoresizingMaskIntoConstraints = NO;
    _contentLable.numberOfLines = 0;
    _contentLable.lineBreakMode = NSLineBreakByWordWrapping;
    _contentLable.font = [UIFont systemFontOfSize:15];

    [self.contentView addSubview:_contentLable];

    [NSLayoutConstraint activateConstraints:@[
        [_contentLable.topAnchor constraintEqualToAnchor:self.nickNameLable.bottomAnchor constant:kMomentSpaceBetweenTopAndBottom],
        [_contentLable.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:30],
        [_contentLable.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:30]
    ]];
}

#pragma mark - MomentCellModelUpdateable

- (void)updateCellModel:(MomentCellModel *)cellModel {
    self.nickNameLable.text = cellModel.nickNameLable;
    self.contentLable.text = cellModel.contentLable;

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
    // 图片数量发生变化所以contentView的底部约束需要更新一下
    [self contentViewBottomConstraint:self.buttons[cellModel.images.count - 1]];
}

#pragma mark ClickEvent

- (void)testButton {
    NSLog(@"!!!!!!!!!!!!!!");
}

#pragma mark -Private

/// 用于更新contentView的底部约束
- (void)contentViewBottomConstraint:(UIButton *)button {
    if (_contentViewBottomConstraint) {
        [self.contentView removeConstraint:_contentViewBottomConstraint];
    }
    _contentViewBottomConstraint = [self.contentView.bottomAnchor constraintEqualToAnchor:button.bottomAnchor constant:10];
    [self.contentView addConstraint:_contentViewBottomConstraint];
}

@end
