//
//  FrameMomentCell.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "FrameMomentCell.h"

@interface FrameMomentCell ()

@property (nonatomic, strong) NSArray<UIButton *> *buttons;

@property (nonatomic, strong) UILabel *userName;

@property (nonatomic, strong) UILabel *userText;

@end

@implementation FrameMomentCell

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.contentView.backgroundColor = UIColor.greenColor;
        self.clipsToBounds = YES;
        
        [self initButtons];
        
        _userName = [[UILabel alloc] init];
        _userName.backgroundColor = [UIColor blueColor];
        _userName.font = [UIFont systemFontOfSize:MomentTextHeight];
        
        _userText = [[UILabel alloc] init];
        _userText.backgroundColor = [UIColor orangeColor];
        _userText.font = [UIFont systemFontOfSize:MomentTextHeight / 2];
        
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userText];
    }
    return self;
}

- (void)initButtons{
    NSMutableArray *buttons = [NSMutableArray array];
    for(int i = 0; i < 9; i ++){
        
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = UIColor.whiteColor;
        button.hidden = YES;
        button.layer.borderWidth = 1;
        
        CGFloat buttonX = i % 3 * MomentImageWidth;
        CGFloat buttonY = floor(i / 3.0) * MomentImageHeight;
        button.frame = CGRectMake(buttonX + MomentSpeceToLeft, buttonY + MomentTextHeight * 2 + 20, MomentImageWidth , MomentImageHeight );
        
        [self.contentView addSubview:button];
        [buttons addObject:button];
    }
    _buttons = [buttons copy];
}

#pragma mark -MomentCellModelUpdateable
- (void)updateCellModel:(MomentCellModel *)cellModel{
    
    _userName.text = cellModel.userName;
    _userName.frame = CGRectMake(0, 0,self.userName.text.length * MomentTextHeight  + MomentSpaceBetweenTopAndBottom,
                                     MomentTextHeight );

    _userText.text = cellModel.userText;
    _userText.frame = CGRectMake(30, 30, self.userText.text.length * MomentTextHeight / 2.0 + MomentSpaceBetweenTopAndBottom,
                                     MomentTextHeight / 2.0 );
    
    for ( int i = 0; i < 9; i ++){
        if(i >= self.buttons.count){
            NSAssert(NO, @"check updateCellModel");
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


@end
