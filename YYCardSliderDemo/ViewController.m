//
//  ViewController.m
//  YYCardSliderDemo
//
//  Created by Ryan on 2017/6/6.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ViewController.h"

#import "YYCardContainer.h"



#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <YYCardContainerDelegate>

/* <#description#> */
@property (nonatomic,strong) NSMutableArray *dataArray;
/* <#description#> */
@property (nonatomic,strong) UIButton *dislikeBtn;
/* <#description#> */
@property (nonatomic,strong) UIButton *likeBtn;
/*  */
@property (nonatomic,strong) YYCardContainer *container;
/* <#description#> */
@property (nonatomic,strong) YYCardView *cardView;

@end

@implementation ViewController

/* <#description#> */
- (NSMutableArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i < 9; i++) {
        NSDictionary *dict = @{
                               @"image" : [NSString stringWithFormat:@"image_%d",i+1],
                               @"title" : [NSString stringWithFormat:@"page %d",i+1],
                               };
        [self.dataArray addObject:dict];
    }
    
    self.container = [[YYCardContainer alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenWidth) style:YYDragStyleUpOverlay];
    self.container.delegate = self;
    self.container.backgroundColor = [UIColor colorWithRed:0.792 green:0.918 blue:0.808 alpha:1.00];
    [self.view addSubview:self.container];
    
    [self.container reloadData];
    
    self.dislikeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 85, 85)];
    self.dislikeBtn.center = CGPointMake(30+85/2, ScreenWidth+(ScreenHeight-ScreenWidth)/2);
    [self.dislikeBtn setImage:[UIImage imageNamed:@"nope"] forState:UIControlStateNormal];
    self.dislikeBtn.layer.cornerRadius = 85 / 2;
    self.dislikeBtn.layer.masksToBounds = true;
    [self.dislikeBtn addTarget:self action:@selector(clickDislikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dislikeBtn];
    
    self.likeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 85, 85)];
    self.likeBtn.center = CGPointMake(ScreenWidth-30-85/2, ScreenWidth+(ScreenHeight-ScreenWidth)/2);
    [self.likeBtn setImage:[UIImage imageNamed:@"liked"] forState:UIControlStateNormal];
    self.likeBtn.layer.cornerRadius = 85 / 2;
    self.likeBtn.layer.masksToBounds = true;
    [self.likeBtn addTarget:self action:@selector(clickLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.likeBtn];
    
    
}

//MARK:-UIButton Action
- (void)clickDislikeBtn:(UIButton *)sender {

    [self.container removeForDirection:YYDragDirectionLeft];
}

- (void)clickLikeBtn:(UIButton *)sender {
    
    [self.container removeForDirection:YYDragDirectionRight];
}

//MARK:-YYCardContainerViewDelegate
- (YYCardView *)dragContainer:(YYCardContainer *)dragContainer cardViewForIndex:(NSInteger)index {
//    if (self.cardView == nil) {
//        self.cardView = [[YYCardView alloc] initWithFrame:dragContainer.bounds];
//        [self.cardView configData:self.dataArray[index]];
//    }
    YYCardView *cardView = [[YYCardView alloc] initWithFrame:dragContainer.bounds];
    [cardView configData:self.dataArray[index]];
    return
    cardView;
}

- (NSInteger)numberOfCardViewsInDragContainer:(YYCardContainer *)dragContainer {
    
    return self.dataArray.count;
}


- (void)dragContainer:(YYCardContainer *)dragContainer cardView:(YYCardView *)cardView didSelectIndex:(NSInteger)didSelectIndex {
    
    NSLog(@"------%ld",didSelectIndex);
}

- (void)dragContainer:(YYCardContainer *)dragContainer finishedDragLastCardView:(BOOL)finishedDragLastCardView {
    
    [dragContainer reloadData];
}

- (void)dragContainer:(YYCardContainer *)dragContainer dragDirection:(YYDragDirection)dragDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio {
    
    CGFloat scale = 1 + ((kBoundaryRatio > fabs(widthRatio) ? fabs(widthRatio) : kBoundaryRatio)) / 4;
    if (dragDirection == YYDragDirectionLeft) {
         self.dislikeBtn.transform = CGAffineTransformMakeScale(scale, scale);
    }
    if (dragDirection == YYDragDirectionRight) {
         self.likeBtn.transform = CGAffineTransformMakeScale(scale, scale);
    }
}



@end
























































































