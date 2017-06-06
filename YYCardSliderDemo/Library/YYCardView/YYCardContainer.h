//
//  YYCardContainerView.h
//  YYCardSliderDemo
//
//  Created by Ryan on 2017/6/6.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYCardView.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//MARK:----拖动方向枚举----
typedef NS_ENUM(NSInteger,YYDragDirection) {
    YYDragDirectionDefault,
    YYDragDirectionLeft,
    YYDragDirectionRight
};

//MARK:----拖动类型枚举----
typedef NS_ENUM(NSInteger,YYDragStyle) {
    YYDragStyleUpOverlay,
    YYDragStyleDownOverlay
};

//MARK:----常量----
static const CGFloat kBoundaryRatio   = 0.8f;
static const CGFloat kSecondCardScale = 0.95f;
static const CGFloat kTherdCardScale  = 0.9f;

static const CGFloat kCardEdage        = 15.0f;
static const CGFloat kContainerEdage   = 15.0f;
static const CGFloat kNavigationHeight = 64.0f;

static const CGFloat kVisibleCardViewCount     = 3; //可以看到的最多的cardView的个数


//MARK:----YYCardContainerDelegate----
@class YYCardContainer;
@protocol YYCardContainerDelegate <NSObject>

@required
//对cardView进行创建
- (YYCardView *)dragContainer:(YYCardContainer *)dragContainer cardViewForIndex:(NSInteger)index;
//返回cardView的个数
- (NSInteger)numberOfCardViewsInDragContainer:(YYCardContainer *)dragContainer;

@optional
//拖拽方向和拖拽时的宽和高比例
- (void)dragContainer:(YYCardContainer *)dragContainer dragDirection:(YYDragDirection)dragDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio;
//对拖拽的是哪一个进行判断
- (void)dragContainer:(YYCardContainer *)dragContainer cardView:(YYCardView *)cardView didSelectIndex:(NSInteger)didSelectIndex;
//是否对最后一个拖拽完
- (void)dragContainer:(YYCardContainer *)dragContainer finishedDragLastCardView:(BOOL)finishedDragLastCardView;


@end


@interface YYCardContainer : UIView

/* 代理 */
@property (nonatomic,weak) id<YYCardContainerDelegate>delegate;
//初始化
- (instancetype)initWithFrame:(CGRect)frame style:(YYDragStyle)style;
//删除方向
- (void)removeForDirection:(YYDragDirection)direction;
//加载数据
- (void)reloadData;

@end
































































