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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<MomentCellModel *> *cellModels;
/// 是否使用静态布局方式展示
@property (nonatomic, assign, getter=isFrameShow) BOOL frameShow;

@end

@implementation ViewController

#pragma mark - LifeCircel

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.frameShow = YES;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

/// 当点击TableViewCell时改变布局方式
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self changeFormat];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isFrameShow]) {
        return [self.cellModels[indexPath.row] cellHeight];
    }
    return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}

/// 根据frameShow来决定返回的cell是动态布局还是静态布局
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<MomentCellModelUpdateable> *cell;

    if ([self isFrameShow]) {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FrameMomentCell class]) forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AutoLayoutMomentCell class]) forIndexPath:indexPath];
    }

    if (!cell) {
        cell = self.isFrameShow
                   ? [[FrameMomentCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:NSStringFromClass([FrameMomentCell class])]
                   : [[AutoLayoutMomentCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:NSStringFromClass([AutoLayoutMomentCell class])];
    }
    [cell updateCellModel:self.cellModels[indexPath.row]];
    return cell;
}

#pragma mark - Private

- (void)changeFormat {
    if ([self isFrameShow]) {
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 150;
    } else {
        self.tableView.rowHeight = 0;
    }
    self.frameShow ^= 1;
    [self.tableView reloadData];
}

#pragma mark - Set and Get

- (UITableView *)tableView {
    if (!_tableView) {
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

- (NSArray<MomentCellModel *> *)cellModels {
    if (!_cellModels) {
        NSMutableArray<MomentCellModel *> *cellModels = [NSMutableArray array];
        for (int i = 0; i < 100; i++) {
            [cellModels addObject:[[MomentCellModel alloc] init]];
        }
        _cellModels = [cellModels copy];
    }
    return _cellModels;
}
@end
