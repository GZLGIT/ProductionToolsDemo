//
//  TextCollectionViewController.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/28.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "TextCollectionViewController.h"
#import "GZLHeaderFlowLayout.h"
#import "TextCollectionViewCell.h"

@interface TextCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation TextCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"collectionView";

    [self.collectionView registerClass:[TextCollectionViewCell class] forCellWithReuseIdentifier:@"clellID"];
    
    [self.view addSubview:self.collectionView];
    
}



#pragma mark--collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"clellID" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark--setter&getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        GZLHeaderFlowLayout *flowLayout = [[GZLHeaderFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 12;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        flowLayout.itemSize = CGSizeMake((Size_width-36)/2, (Size_width-36)/2+75);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(0, kTopHeight, Size_width, Size_height-kBottomHeight)) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
    }
    return _collectionView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
