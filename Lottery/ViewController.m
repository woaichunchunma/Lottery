//
//  ViewController.m
//  Lottery
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaohaodong. All rights reserved.
//

#import "ViewController.h"
#import "LuckView.h"

@interface ViewController ()<LuckViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLuckView];
}


- (void)createLuckView {
    LuckView *luckView = [[LuckView alloc] initWithFrame:CGRectMake(0, (ScreenHeight - ScreenWidth) * 0.5, ScreenWidth, ScreenWidth)];
    
    //网络图片地址
    luckView.imageArray = [@[@"http://st.depositphotos.com/1842549/2870/i/950/depositphotos_28700059-Green-square-shiny-icon.jpg",@"http://st.depositphotos.com/1842549/2869/i/950/depositphotos_28699735-Green-square-shiny-icon.jpg",@"http://st.depositphotos.com/1842549/2870/i/950/depositphotos_28700445-Green-square-shiny-icon.jpg",@"http://st.depositphotos.com/1842549/2870/i/950/depositphotos_28700229-Green-square-shiny-icon.jpg",@"http://www.iconpng.com/png/boxed_metal_icons/gamecenter.png",@"http://www.iconpng.com/png/boxed_metal_icons/line.png",@"http://www.iconpng.com/png/boxed_metal_icons/internet_explorer.png",@"http://www.iconpng.com/png/boxed_metal_icons/gps.png"]mutableCopy];
    //指定抽奖结果,对应数组中的元素
    luckView.stopCount = arc4random()%luckView.imageArray.count;
    NSLog(@"stopCount = %d",luckView.stopCount);
    //设置代理
    luckView.delegate = self;
    [self.view addSubview:luckView];
}


#pragma mark - LuckViewDelegate
/**
 *  中奖
 *
 *  @param count 返回结果数组的下标
 */
- (void)luckViewDidStopWithArrayCount:(NSInteger)count {
    NSLog(@"抽到了第%ld个",count);
}


/**
 *  点击了数组中的第几个元素
 *
 *  @param btn
 */
- (void)luckSelectBtn:(UIButton *)btn {
    NSLog(@"点击了数组中的第%ld个元素",btn.tag);
    
}




@end
