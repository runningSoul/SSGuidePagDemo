//
//  LSPageScrollView.h
//  LSPageControl
//
//  Created by  sen on 15/8/28.
//  Copyright (c) 2015年  sen. All rights reserved.
//

#define PAGECONTROL_jx  20 //缩略点之间的间隙

#import <UIKit/UIKit.h>

typedef void (^blockAllItems)(NSArray* items);

typedef NS_ENUM(NSInteger, LSPageShowStyle) {
    LSPageShowStyleRound = 0,
    LSPageShowStyleLine
};

@interface LSPageScrollView : UIView
<UIScrollViewDelegate>
{
    NSInteger _num;
    UIView* pagecontrolview;
}
- (instancetype)initWithFrame:(CGRect)frame numberOfItem:(NSInteger)num itemSize:(CGSize)itemsize complete:(blockAllItems)allitems;
@property (nonatomic,assign)NSInteger num;
@property (nonatomic, assign) BOOL pagingEnabled;   //默认是YES

@property (nonatomic, assign) BOOL hiddenPageControl;   //隐藏页数标识
@property (nonatomic, strong) UIImage* defaultPageIndicatorImage;   //默认page图
@property (nonatomic, strong) UIImage* currentPageIndicatorImage;   //当前page图

@property (nonatomic, assign) NSInteger pages;  //页数,如果赋值将有最高优先级
@property (nonatomic, assign) LSPageShowStyle showstyle;    //默认随图片风格变化而变化


@property (nonatomic,strong)UIImageView* moveMark;

@end
