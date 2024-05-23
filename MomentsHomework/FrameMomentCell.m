//
//  FrameMomentCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "FrameMomentCell.h"

@interface FrameMomentCell ()

@property (nonatomic, strong) NSMutableArray<UIButton *> *buttons;

@property (nonatomic, strong) UILabel *userName;

@property (nonatomic, strong) UILabel *userText;

@end

@implementation FrameMomentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = UIColor.greenColor;
        self.clipsToBounds = YES;
        for(int i = 0; i < 9; i ++){
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = UIColor.whiteColor;
            button.hidden = YES;
            button.layer.borderWidth = 1;
            
            CGFloat buttonX = i % 3 * cellImageWidth;
            CGFloat buttonY = floor(i / 3.0) * cellImageHeight;
            
            button.frame = CGRectMake(buttonX + 50, buttonY + cellTextHeight * 2 + 20, cellImageWidth , cellImageHeight );
            
            [self.contentView addSubview:button];
            [self.buttons addObject:button];
            NSLog(@"%lf %lf %lf %lf",button.frame.origin.x,button.frame.origin.y,button.frame.size.width,button.frame.size.height);
        }
        self.userName.backgroundColor = UIColor.blueColor;
        self.userName.font = [UIFont systemFontOfSize:cellTextHeight];
        self.userText.backgroundColor = UIColor.blueColor;
        self.userText.font = [UIFont systemFontOfSize:cellTextHeight / 2];
        self.userName.frame = CGRectMake(0, 0, 100, 1000);
        NSLog(@"%lf %lf %lf %lf",self.userName.frame.origin.x,self.userName.frame.origin.y,self.userName.frame.size.width,self.userName.frame.size.height);
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userText];
    }
    return self;
}

- (void)updateCellModel:(MomentCellModel *)cellModel{
    
    self.userName.text = cellModel.userName;
   
    
    self.userText.text = cellModel.userText;
    self.userText.frame = CGRectMake(30, 30, cellTextHeight / 2.0, self.userText.text.length * cellTextHeight / 2.0 + 10 );
//    for(id *tmp in self.contentView.subviews){
//        if
//    }
    for ( int i = 0; i < 9; i ++){
        if(i >= self.buttons.count){
            NSAssert(NO, @"(void)updateCellModel:(MomentCellModel *)cellModel{ 错误");
            return;
        }
        UIButton *button = self.buttons[i];
        button.hidden = NO;
        if(i < cellModel.images.count){
            [button setBackgroundImage:cellModel.images[i] forState:UIControlStateNormal];
        }else {
            button.hidden = YES;
        }
    }
}

- (UILabel *)userText{
    if(!_userText){
        _userName = [[UILabel alloc] init];
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

    // Configure the view for the selected state
}

@end
