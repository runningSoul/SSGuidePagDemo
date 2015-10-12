//
//  chooseMain.m
//  SSGuidePagDemo
//
//  Created by 杨 尚彬 on 15/10/12.
//  Copyright (c) 2015年 dongxiao. All rights reserved.
//

#import "chooseMain.h"
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define VersionKey @"version"
@implementation chooseMain
+(void)chooseRootViewController:(UIWindow *)window
{
    // 1.判断是否有新特性,用户的软件有新版本的时候
    // 获取Info.plist
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    // 获取当前用户的软件版本
    NSString *currentVersion = infoDict[@"CFBundleVersion"];

    
    
    
    NSString *lastVersion = [UserDefaults objectForKey:VersionKey];
    
  
    
    if (![currentVersion isEqualToString:lastVersion]) { // 1.0 , 1.1 不相等,意味有新版本
        // 进入新特性界面
        GuideCollection *newFeatureVc = [[GuideCollection alloc] init];
        window.rootViewController = newFeatureVc;
        
//        [[SDImageCache sharedImageCache] cleanDisk];
    }else{
        // 进入主要界面
        window.rootViewController = [[ViewController alloc]init];
    }
}
@end
