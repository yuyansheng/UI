//
//  AutoLayoutMomentCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/23.
//

#import "AutoLayoutMomentCell.h"


@interface AutoLayoutMomentCell ()

@property (nonatomic, strong) NSMutableArray<UIButton *> *buttons;

@property (nonatomic, strong) UILabel *userName;

//@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UILabel *userText;

@property (nonatomic, strong) NSLayoutConstraint *tableViewCellHeight;

@end

@implementation AutoLayoutMomentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
       // self.myView = [[UIView alloc] init];
       // self.myView.translatesAutoresizingMaskIntoConstraints = NO;
        //[self addSubview:self.myView];
        self.contentView.backgroundColor = UIColor.greenColor;
        
        self.clipsToBounds = YES;

        [self initUserName];
        [self initUserText];
        for(int i = 0; i < 9; i ++){
            UIButton *button = [[UIButton alloc] init];
            button.translatesAutoresizingMaskIntoConstraints = NO;
            button.backgroundColor = UIColor.whiteColor;
            button.hidden = YES;
            [button addTarget:self action:@selector(textButton) forControlEvents:UIControlEventTouchUpInside];
            button.layer.borderWidth = 1;
            CGFloat buttonX = i % 3 * cellImageWidth;
            CGFloat buttonY = floor(i / 3.0) * cellImageHeight;
            NSLayoutConstraint * buttonTopByUserText = [NSLayoutConstraint constraintWithItem:button 
                                                                                    attribute:NSLayoutAttributeTop
                                                                                    relatedBy:NSLayoutRelationEqual 
                                                                                       toItem:self.userText
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                   multiplier:1
                                                                                     constant:10 + buttonY ];
            
            NSLayoutConstraint *buttonLeftByUserText = [NSLayoutConstraint constraintWithItem:button
                                                                                    attribute:NSLayoutAttributeLeft
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.contentView
                                                                                    attribute:NSLayoutAttributeLeft
                                                                                   multiplier:1
                                                                                     constant:50 + buttonX ];
            
            NSLayoutConstraint *buttonHeight = [NSLayoutConstraint constraintWithItem:button
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1
                                                                             constant:cellImageHeight];
            NSLayoutConstraint *buttonWidth = [NSLayoutConstraint constraintWithItem:button
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1
                                                                             constant:cellImageWidth];
            [self.contentView addSubview:button];
            [self.buttons addObject:button];
            
            [self.contentView addConstraints:@[buttonTopByUserText, buttonLeftByUserText, buttonWidth, buttonHeight]];
            
            
        }
        
    }
    return self;
}

- (void)initUserName{
    [self.contentView addSubview:self.userName];
    self.userName.backgroundColor = [UIColor blueColor];
    self.userName.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *textDic = @{@"userName":self.userName};
    NSString *userNameHVFL = @"H:|-1-[userName]";
    NSString *userNameVVFL = @"V:|-1-[userName]";
    NSArray<NSLayoutConstraint *> *cH = [NSLayoutConstraint constraintsWithVisualFormat:userNameHVFL options:0 metrics:nil views:textDic];
    NSArray<NSLayoutConstraint *> *cV = [NSLayoutConstraint constraintsWithVisualFormat:userNameVVFL options:0 metrics:nil views:textDic];
    [self.contentView addConstraints:cH];
    [self.contentView addConstraints:cV];
}

- (void)initUserText{
    self.userText.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.userText];
    
    self.userText.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *textDic = @{@"userName":self.userName,@"userText":self.userText};
    NSString *userTextHVFL = @"H:|-20-[userText]-20-|";
    NSString *userTextVVFL = @"V:[userName]-10-[userText]";
    self.userText.numberOfLines=0;
    self.userText.lineBreakMode = NSLineBreakByWordWrapping;
    self.userText.font = [UIFont systemFontOfSize:15];
    NSArray<NSLayoutConstraint *> *cH = [NSLayoutConstraint constraintsWithVisualFormat:userTextHVFL options:0 metrics:nil views:textDic];
    NSArray<NSLayoutConstraint *> *cV = [NSLayoutConstraint constraintsWithVisualFormat:userTextVVFL options:0 metrics:nil views:textDic];
    [self.contentView addConstraints:cH];
    [self.contentView addConstraints:cV];
}

- (void)textButton{
    NSLog(@"!!!!!!!!!!!!!!");
}

- (void)updateCellModel:(MomentCellModel *)cellModel{
    
    self.userName.text = cellModel.userName;
    self.userText.text = cellModel.userText;
    for ( int i = 0; i < 9; i ++){
        if(i >= self.buttons.count){
            NSAssert(NO, @"(void)updateCellModel:(MomentCellModel *)cellModel{ 错误");
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

- (void)updateTableViewCellHeight:(UIButton *)button{
    NSLog(@"111111111");
    if(_tableViewCellHeight){
        [self.contentView removeConstraint:self.tableViewCellHeight];
    }
    self.tableViewCellHeight = [NSLayoutConstraint constraintWithItem:self.contentView
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:button
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:10];
    [self.contentView addConstraint:self.tableViewCellHeight];
}

- (UILabel *)userText{
    if(!_userText){
        _userText = [[UILabel alloc] init];
    }
    return _userText;
}

- (UILabel *)userName{
    if(!_userName){
        _userName = [[UILabel alloc] init];
    }
    return _userName;
}

- (NSMutableArray<UIButton *> *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
}

@end
