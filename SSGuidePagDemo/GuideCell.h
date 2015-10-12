//
//  GuideCell.h
//  SSGuidePagDemo
//
//  Created by 杨 尚彬 on 15/10/12.
//  Copyright (c) 2015年 dongxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *image;
- (void)setIndexPath:(NSIndexPath *)indexPath itemCount:(NSInteger)count;
@end
