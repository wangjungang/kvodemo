//
//  newViewController2.m
//  kvodemo
//
//  Created by 王俊钢 on 2018/5/3.
//  Copyright © 2018年 wangjungang. All rights reserved.
//

#import "newViewController2.h"

@interface newViewController2 ()
@property (nonatomic,strong) UIButton *goback;
@property (nonatomic,strong) NSArray *typearr;
@end

@implementation newViewController2

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
    self.typearr = @[@"1",@"2",@"3"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
