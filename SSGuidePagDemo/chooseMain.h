//
//  chooseMain.h
//  SSGuidePagDemo
//
//  Created by 杨 尚彬 on 15/10/12.
//  Copyright (c) 2015年 dongxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "GuideCollection.h"
@interface chooseMain : NSObject
/**
 *  选择窗口的根控制器(需要进入新特性还是首页)
 *
 */
+ (void)chooseRootViewController:(UIWindow *)window;
@end
