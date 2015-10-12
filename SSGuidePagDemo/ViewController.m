//
//  ViewController.m
//  SSGuidePagDemo
//
//  Created by 杨 尚彬 on 15/10/12.
//  Copyright (c) 2015年 dongxiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 100, 100, 100)];
    label.text = @"我就是主页";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:label];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
