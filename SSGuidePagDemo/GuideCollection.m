//
//  GuideCollection.m
//  SSGuidePagDemo
//
//  Created by 杨 尚彬 on 15/10/12.
//  Copyright (c) 2015年 dongxiao. All rights reserved.
//

#import "GuideCollection.h"
#import "GuideCell.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface GuideCollection ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *CollectionView;

@property (nonatomic, weak) UIPageControl *pageControl;



@property (nonatomic,strong)NSMutableArray *countArray;
@end
static NSString *const reuseIdentifier = @"cell";
@implementation GuideCollection

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight+40) collectionViewLayout:layout];
    [self.view addSubview:self.CollectionView];
    
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.CollectionView.pagingEnabled = YES;
    self.CollectionView.bounces = NO;
    self.CollectionView.showsHorizontalScrollIndicator = NO;
    
    self.CollectionView.dataSource = self;
    self.CollectionView.delegate = self;
    
    
    [self.CollectionView registerClass:[GuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.navigationController.navigationBarHidden = YES;
    [self setUpData];
    [self setUpPageControl];
}
- (void)setUpData
{
   
        self.countArray = [NSMutableArray arrayWithObjects:@"bg_0.png",@"bg_1.png",@"bg_2.png",@"bg_3.png",@"bg_4.png", nil];
   
}
#pragma mark -添加pageControl
- (void)setUpPageControl
{
    
    UIPageControl *padgeControl = [[UIPageControl alloc] init];
    [self.view addSubview:padgeControl];
    _pageControl = padgeControl;
    _pageControl.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50,[UIScreen mainScreen].bounds.size.height - 20,100, 20);
    padgeControl.numberOfPages = self.countArray.count;
    padgeControl.hidesForSinglePage = YES;
    padgeControl.pageIndicatorTintColor = [UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1.0];
    padgeControl.currentPageIndicatorTintColor = [UIColor colorWithRed:255/255.0 green:128/255.0 blue:1/255.0 alpha:1.0];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    int page = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    _pageControl.currentPage = page;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.countArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *imageStr = self.countArray[indexPath.row];
    cell.image = [UIImage imageNamed:imageStr];
    [cell setIndexPath:indexPath itemCount:self.countArray.count];
    return cell;
}



@end
