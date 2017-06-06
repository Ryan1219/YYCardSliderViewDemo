//
//  YYCardView.m
//  YYCardSliderDemo
//
//  Created by Ryan on 2017/6/6.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "YYCardView.h"

@interface YYCardView ()

/* <#description#> */
@property (nonatomic,strong) UIImageView *imageView;
/* <#description#> */
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation YYCardView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true;
        
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;

        [self configUI];
    }
    return self;
}

//MARK:-创建界面
- (void)configUI {
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
}
//MARK:-赋值
- (void)configData:(NSDictionary *)dict {
    self.imageView.image  = [UIImage imageNamed:dict[@"image"]];
    self.titleLabel.text = dict[@"title"];
}

- (void)layoutSubviews {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.imageView.frame   = CGRectMake(0, 0, width, height - 64);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), width, 64);
}
@end

















































