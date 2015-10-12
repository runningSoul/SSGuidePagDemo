//
//  GuideCell.m
//  SSGuidePagDemo
//
//  Created by 杨 尚彬 on 15/10/12.
//  Copyright (c) 2015年 dongxiao. All rights reserved.
//

#import "GuideCell.h"
#import "ViewController.h"
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define VersionKey @"version"


@interface GuideCell ()
@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIButton *startButton;
@end

@implementation GuideCell
- (UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        button.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -50, 50);
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"进入主页" forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        // 计算尺寸
        [button sizeToFit];
        
        [self addSubview:button];
        
        _startButton = button;
    }
    return  _startButton;
}


- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageV  = [[UIImageView alloc] init];
        
        _imageView = imageV;
        
        [self addSubview:imageV];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}


- (void)setIndexPath:(NSIndexPath *)indexPath itemCount:(NSInteger)count
{
    // indexPath.item =  indexPath.row
    if (indexPath.item == count - 1) { // 就是最后一个cell
        
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
}

- (void)layoutSubviews
{
    // 一定要调用,设置系统自带的子控件位置,contentView
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    // 设置分享按钮的位置
    
    self.startButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.83);
    self.startButton.backgroundColor = [UIColor whiteColor];
}
- (void)start
{
    ViewController *viewVC = [[ViewController alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = viewVC;
    
    // 获取Info.plist
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    // 获取当前用户的软件版本
    NSString *currentVersion = infoDict[@"CFBundleVersion"];
    
    // 存储最新版本号
    [UserDefaults setObject:currentVersion forKey:VersionKey];
    // 同步
    [UserDefaults synchronize];
    
}

@end
