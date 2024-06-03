//
//  AutoLayoutMomentCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/23.
//

#import "AutoLayoutMomentCell.h"


@interface AutoLayoutMomentCell ()
//按钮数组
@property (nonatomic, strong) NSArray<UIButton *> *buttons;
//用户名
@property (nonatomic, strong) UILabel *userName;
//一段文字
@property (nonatomic, strong) UILabel *userText;
//TableViewCell高度
@property (nonatomic, strong) NSLayoutConstraint *tableViewCellHeight;

@end


#pragma mark - Init
@implementation AutoLayoutMomentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = UIColor.greenColor;
        self.clipsToBounds = YES;
        
        [self initUserName];
        [self initUserText];
        [self initButtons];
        
    }
    return self;
}

- (void)initButtons{
    
    NSMutableArray *buttons = [NSMutableArray array];
    for(int i = 0; i < 9; i ++){
        UIButton *button = [[UIButton alloc] init];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        button.backgroundColor = UIColor.whiteColor;
        button.hidden = YES;
        [button addTarget:self action:@selector(textButton) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderWidth = 1;
        
        CGFloat buttonX = i % 3 * MomentImageWidth;
        CGFloat buttonY = floor(i / 3.0) * MomentImageHeight;
        [self.contentView addSubview:button];
        
        NSLayoutConstraint *buttonTop = [button.topAnchor constraintEqualToAnchor:_userText.bottomAnchor
                                                                         constant:MomentSpaceBetweenTopAndBottom + buttonY];
        buttonTop.priority = UILayoutPriorityDefaultLow;
        [NSLayoutConstraint activateConstraints:@[
            buttonTop,
            [button.heightAnchor constraintEqualToConstant:MomentImageHeight],
            [button.widthAnchor constraintEqualToConstant:MomentImageWidth],
            [button.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor
                                              constant:MomentSpeceToLeft + buttonX]
        ]];
        
      [buttons addObject:button];
    }
    _buttons = [buttons copy];
}

- (void)initUserName{
    _userName = _userName = [[UILabel alloc] init];
    _userName.backgroundColor = [UIColor blueColor];
    _userName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_userName];
    
    [NSLayoutConstraint activateConstraints:@[
        [_userName.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:1],
        [_userName.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:1]
    ]];
}

- (void)initUserText{
    _userText = [[UILabel alloc] init];
    _userText.backgroundColor = [UIColor orangeColor];
    _userText.translatesAutoresizingMaskIntoConstraints = NO;
    _userText.numberOfLines=0;
    _userText.lineBreakMode = NSLineBreakByWordWrapping;
    _userText.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_userText];
    
    [NSLayoutConstraint activateConstraints:@[
        [_userText.topAnchor constraintEqualToAnchor:self.userName.bottomAnchor constant:MomentSpaceBetweenTopAndBottom],
        [_userText.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:30],
        [_userText.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:30]
    ]];
}

#pragma mark - MomentCellModelUpdateable
- (void)updateCellModel:(MomentCellModel *)cellModel{
    
    self.userName.text = cellModel.userName;
    self.userText.text = cellModel.userText;
    
    for ( int i = 0; i < 9; i ++){
        if(i >= self.buttons.count){
            NSAssert(NO, @"check updateCellModel");
            return;
        }
        
        UIButton *button = self.buttons[i];
        
        if(i < cellModel.images.count){
            button.hidden = NO;
            [button setBackgroundImage:cellModel.images[i] forState:UIControlStateNormal];
        }else {
            button.hidden = YES;
        }
    }
    
    [self updateTableViewCellHeight:self.buttons[cellModel.images.count - 1]];
}

#pragma mark ClickEvent
- (void)textButton{
    NSLog(@"!!!!!!!!!!!!!!");
}

#pragma mark -Private
- (void)updateTableViewCellHeight:(UIButton *)button{
    
    if(_tableViewCellHeight){
        [self.contentView removeConstraint:self.tableViewCellHeight];
    }
    self.tableViewCellHeight = [self.contentView.bottomAnchor constraintEqualToAnchor:button.bottomAnchor
                                                                             constant:10];
    [self.contentView addConstraint:self.tableViewCellHeight];
}


@end
