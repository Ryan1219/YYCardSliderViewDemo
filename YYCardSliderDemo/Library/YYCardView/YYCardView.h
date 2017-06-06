//
//  YYCardView.h
//  YYCardSliderDemo
//
//  Created by Ryan on 2017/6/6.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYCardView : UIView

@property (nonatomic) CGAffineTransform originalTransform;
//MARK:-界面布局
- (void)layoutSubviews;
//MARK:-赋值
- (void)configData:(NSDictionary *)dict;

@end
