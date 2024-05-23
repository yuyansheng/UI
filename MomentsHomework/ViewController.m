//
//  ViewController.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "FrameMomentCell.h"
#import "ViewController.h"
#import "FrameMomentCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray <MomentCellModel *> *cellModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.cellModels[indexPath.row] cellHeight];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell<MomentCellModelUpdateable> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FrameMomentCell class]) forIndexPath:indexPath];
    
    
    [cell updateCellModel:self.cellModels[indexPath.row]];
    
    return cell;
}

- (UITableView *)tableView{
    NSLog(@"!!!!!");
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.bounces = NO;
        [_tableView registerClass:[FrameMomentCell class] forCellReuseIdentifier:NSStringFromClass([FrameMomentCell class])];
    }
    return _tableView;
}
- (NSArray<MomentCellModel *> *)cellModels{
    if(!_cellModels){
        NSMutableArray<MomentCellModel *> *cellModels = [NSMutableArray array];
        for(int i = 0; i < 10; i ++){
            [cellModels addObject:[[MomentCellModel alloc] init]];
        }
        _cellModels = [cellModels copy];
    }
    return _cellModels;
}
@end
