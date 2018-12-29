//
//  TextCollectionViewController.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/28.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "TextCollectionViewController.h"

@interface TextCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation TextCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"collectionView";
    
}



#pragma mark--collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [UICollectionViewCell new];
}

#pragma mark--setter&getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(0, TableViewFrameY, Size_width, Size_height-TableViewFrameY)) collectionViewLayout:nil];
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
