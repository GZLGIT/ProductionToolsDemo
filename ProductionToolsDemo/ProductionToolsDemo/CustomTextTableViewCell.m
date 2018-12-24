//
//  CustomTextTableViewCell.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/22.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "CustomTextTableViewCell.h"

@interface CustomTextTableViewCell ()


@property (nonatomic, strong) UIImageView *headerImg;


@end

@implementation CustomTextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    return self;
}


- (void)loadSubViews {
    
    self.headerImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addImg"]];
    self.headerImg.frame = CGRectMake(20, 6, 30, 30);
    [self.contentView addSubview:self.headerImg];
    self.headerImg.backgroundColor = [UIColor redColor];
    // 全圆角 33.4
    self.headerImg.layer.cornerRadius = 4;
    self.headerImg.layer.masksToBounds = YES;
    
    
    
    // 全圆角 内存 33.8~34
    self.headerImg.image = [self.headerImg imageWithRoundCorner:self.headerImg.image cornerRadius:4 size:(CGSizeMake(30, 30))];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
