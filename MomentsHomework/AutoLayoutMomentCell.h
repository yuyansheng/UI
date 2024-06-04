//
//  AutoLayoutMomentCell.h
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/23.
//

#import <UIKit/UIKit.h>
#import "MomentCellModel.h"
NS_ASSUME_NONNULL_BEGIN

/// 动态布局的TableViewCell可以接收一个MomentCellModel的数据来更新视图 布局样式是一个朋友圈
@interface AutoLayoutMomentCell : UITableViewCell <MomentCellModelUpdateable>

@end

NS_ASSUME_NONNULL_END
