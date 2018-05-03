//
//  newViewController.m
//  kvodemo
//
//  Created by 王俊钢 on 2018/5/3.
//  Copyright © 2018年 wangjungang. All rights reserved.
//

#import "newViewController.h"

@interface newViewController ()
@property (nonatomic,strong) UIButton *goback;
@property (nonatomic, copy) NSString *passingText;
@end

@implementation newViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.goback];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *)goback
{
    if(!_goback)
    {
        _goback = [[UIButton alloc] init];
        _goback.backgroundColor = [UIColor orangeColor];
        [_goback addTarget:self action:@selector(gobackclick) forControlEvents:UIControlEventTouchUpInside];
        _goback.frame = CGRectMake(30, 80, 100, 60);
    }
    return _goback;
}

-(void)gobackclick
{
     self.passingText = @"传值了-----";
    [self.navigationController popViewControllerAnimated:YES];
}

@end
