//
//  LSPageScrollView.m
//  LSPageControl
//
//  Created by  sen on 15/8/28.
//  Copyright (c) 2015年  sen. All rights reserved.
//

#import "LSPageScrollView.h"

@implementation LSPageScrollView
{
    UIScrollView* myscrollview;
    
   
    
    NSMutableArray* markimgs;
    
    UIView* pagebgview;
    
    
    
}
- (void)setNum:(NSInteger)num
{
    _num = num;
}
- (instancetype)initWithFrame:(CGRect)frame numberOfItem:(NSInteger)num itemSize:(CGSize)itemsize complete:(blockAllItems)allitems{
    
    self = [super initWithFrame:frame];
    if (self) {
        //
        _num = num;


        //page control view
        
        markimgs = [NSMutableArray array];
        
        pagecontrolview = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-50, self.frame.size.width,50)];
        pagecontrolview.backgroundColor = [UIColor clearColor];
        [self addSubview:pagecontrolview];
        
        //tb3 tb4 jx10
        
        pagebgview = [[UIView alloc] initWithFrame:CGRectZero];
        [pagecontrolview addSubview:pagebgview];
        
        [self loadPageControlSubViews];
        
    }
    return self;
    
}

- (void)loadPageControlSubViews{
    //
    
    //def
    for (int i = 0; i<_num; i++) {
        UIImageView* imgv = [[UIImageView alloc] initWithFrame:CGRectZero];
        imgv.backgroundColor = [UIColor greenColor];
        [pagebgview addSubview:imgv];
        [markimgs addObject:imgv];
        imgv.image = _defaultPageIndicatorImage;

        if (_defaultPageIndicatorImage) {
            imgv.backgroundColor = [UIColor clearColor];
        }
        
    }
    
    //cur
    self.moveMark = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.moveMark.backgroundColor = [UIColor blueColor];
    self.moveMark.image = _currentPageIndicatorImage;

    if (_currentPageIndicatorImage) {
        self.moveMark.backgroundColor = [UIColor clearColor];
    }
    [pagebgview addSubview:self.moveMark];
    
    [self reloadPageViewSize];
}

- (void)reloadPageViewSize{
    
    CGSize pageSize_def = CGSizeMake(30, 30);
    CGSize pageSize_cur = CGSizeMake(50, 50);
    
    if (_defaultPageIndicatorImage) {
        //
        pageSize_def = _defaultPageIndicatorImage.size;
        
    }
    if (_currentPageIndicatorImage) {
        //
        pageSize_cur = _currentPageIndicatorImage.size;
        
    }
    
    CGFloat bg_w = pageSize_def.width*0.5*_num+PAGECONTROL_jx*(_num-1);
    CGFloat bg_h = pageSize_def.height*0.5;
    
    pagebgview.frame = CGRectMake(CGRectGetMidX(pagecontrolview.frame)-bg_w*0.5, CGRectGetMidY(pagecontrolview.bounds)-bg_h*0.5, bg_w, bg_h);
    
    //def
    for (int i = 0; i<markimgs.count; i++) {
        UIImageView* imgv = (UIImageView*)markimgs[i];
        imgv.frame = CGRectMake(i*(pageSize_def.width*0.5+PAGECONTROL_jx), 0, pageSize_def.width*0.5, pageSize_def.height*0.5);
    }
    
    //cur
    self.moveMark.frame = CGRectMake(0, 0, pageSize_cur.width*0.5, pageSize_cur.height*0.5);
}

#pragma mark - SET

- (void)setPages:(NSInteger)pages{
    //未实现
    _num = pages;
    
    [markimgs removeAllObjects];
    
    for (UIView* obj in pagebgview.subviews) {
        [obj removeFromSuperview];
    }
    
    [self loadPageControlSubViews];
}

- (void)setShowstyle:(LSPageShowStyle)showstyle{
    //未实现
    _showstyle = showstyle;
    
}

- (void)setPagingEnabled:(BOOL)pagingEnabled{
    _pagingEnabled = pagingEnabled;
    myscrollview.pagingEnabled = _pagingEnabled;
}
- (void)setHiddenPageControl:(BOOL)hiddenPageControl{
    _hiddenPageControl = hiddenPageControl;
    pagecontrolview.hidden = _hiddenPageControl;
    
}

- (void)setDefaultPageIndicatorImage:(UIImage *)defaultPageIndicatorImage{
    _defaultPageIndicatorImage = defaultPageIndicatorImage;
    for (UIImageView* imgv in markimgs) {
        //
        imgv.image = defaultPageIndicatorImage;
        imgv.backgroundColor = [UIColor clearColor];
    }
    [self reloadPageViewSize];
}
- (void)setCurrentPageIndicatorImage:(UIImage *)currentPageIndicatorImage{
    
    _currentPageIndicatorImage = currentPageIndicatorImage;
    self.moveMark.image = currentPageIndicatorImage;
    self.moveMark.backgroundColor = [UIColor clearColor];
    [self reloadPageViewSize];

}



- (UIColor *)randomColor {
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        (time(NULL));
    }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

@end
