//
//  ViewController.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "FrameMomentCell.h"
#import "ViewController.h"
#import "FrameMomentCell.h"
#import "AutoLayoutMomentCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, copy) NSArray <MomentCellModel *> *cellModels;

@property (nonatomic, getter=isFrameShow) BOOL FrameShow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.FrameShow = 1;
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self changeTableViewCell];
}

-(void)changeTableViewCell{
    if([self isFrameShow]){
        self.FrameShow = 0;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 150;
    }else {
        self.FrameShow = 1;
        
    }
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self isFrameShow]){
        return [self.cellModels[indexPath.row] cellHeight];
    }
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self isFrameShow]){
        UITableViewCell<MomentCellModelUpdateable> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FrameMomentCell class]) forIndexPath:indexPath];
        [cell updateCellModel:self.cellModels[indexPath.row]];
        return cell;
    }else{
        UITableViewCell<MomentCellModelUpdateable> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AutoLayoutMomentCell class]) forIndexPath:indexPath];
        [cell updateCellModel:self.cellModels[indexPath.row]];
        return cell;
    }
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.bounces = NO;
        [_tableView registerClass:[FrameMomentCell class] forCellReuseIdentifier:NSStringFromClass([FrameMomentCell class])];
        [_tableView registerClass:[AutoLayoutMomentCell class] forCellReuseIdentifier:NSStringFromClass([AutoLayoutMomentCell class])];
    }
    return _tableView;
}
- (NSArray<MomentCellModel *> *)cellModels{
    if(!_cellModels){
        NSMutableArray<MomentCellModel *> *cellModels = [NSMutableArray array];
        for(int i = 0; i < 100; i ++){
            [cellModels addObject:[[MomentCellModel alloc] init]];
        }
        _cellModels = [cellModels copy];
    }
    return _cellModels;
}
@end
