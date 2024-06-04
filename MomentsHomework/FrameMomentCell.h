//
//  FrameMomentCell.h
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//
#import "MomentCellModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 静态布局的TableViewCell可以接收一个MomentCellModel的数据来更新视图 布局样式是一个朋友圈
@interface FrameMomentCell : UITableViewCell <MomentCellModelUpdateable>

@end

NS_ASSUME_NONNULL_END
