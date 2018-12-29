//
//  BaseViewController.h
//  AIChaperoneBed
//
//  Created by 郭子立 on 2017/7/5.
//  Copyright © 2017年 GZL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RefreshDataType) {

    RefreshDataTypeHeader,
    RefreshDataTypeFooter,
};

@interface BaseViewController : UIViewController

@property (nonatomic,retain)UIButton *lbtn;
@property (nonatomic,retain)UIView *statusBarView;
@property (nonatomic,retain)UIImageView *navView;
@property (nonatomic,retain)UIButton *rbtn;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic, strong) UIButton *coverBtn;


- (void)clickedCoverBtnAction:(UIButton*)sender;



@end
