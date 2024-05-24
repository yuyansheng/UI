//
//  ViewController.m
//  MomentsHomework
//
//  Created by sanmuzhang on 2024/5/22.
//

#import "FrameMomentCell.h"
#import "ViewController.h"
#import "MomentCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, copy) NSArray <MomentCellModel *> *cellModels;

@property (nonatomic, copy) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellModels[section].images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.cellModels.count;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
//        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
//                                                                              withReuseIdentifier:NSStringFromClass([UICollectionView class])
//                                                                                     forIndexPath:indexPath];
//        header.text
//        
//    }
//    return nil;
//}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell<MomentCellModelUpdateable> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MomentCollectionViewCell class]) forIndexPath:indexPath];
    //NSLog(@"22222");
    [cell updateCellModelByImage:self.cellModels[indexPath.section].images[indexPath.row]];
    
    return cell;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.itemSize = CGSizeMake(100, 100);
        NSLog(@"!!!");
        flowlayout.minimumLineSpacing = 0.1;
        flowlayout.minimumInteritemSpacing = 0.1;
        flowlayout.sectionInset = UIEdgeInsetsMake(10, 45, 10, 45);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor greenColor];
        
        [_collectionView registerClass:[MomentCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MomentCollectionViewCell class])];
        
    }
    return _collectionView;
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
