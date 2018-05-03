//
//  ViewController.m
//  kvodemo
//
//  Created by 王俊钢 on 2018/5/3.
//  Copyright © 2018年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "newViewController.h"
#import "newViewController2.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *namelab;
@property (nonatomic,strong) UIButton *submitbtn;
@property (nonatomic,strong) UIButton *submitbtn2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.namelab];
    [self.view addSubview:self.submitbtn];
    [self.view addSubview:self.submitbtn2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getters


-(UILabel *)namelab
{
    if(!_namelab)
    {
        _namelab = [[UILabel alloc] init];
        _namelab.backgroundColor = [UIColor greenColor];
        _namelab.textColor = [UIColor blackColor];
        _namelab.frame = CGRectMake(20, 80, 100, 50);
        _namelab.font = [UIFont systemFontOfSize:14];
    }
    return _namelab;
}


-(UIButton *)submitbtn
{
    if(!_submitbtn)
    {
        _submitbtn = [[UIButton alloc] init];
        _submitbtn.frame = CGRectMake(20, 140, 100, 50);
        [_submitbtn addTarget:self action:@selector(submitbtnclick) forControlEvents:UIControlEventTouchUpInside];
        _submitbtn.backgroundColor = [UIColor orangeColor];
    }
    return _submitbtn;
}

-(UIButton *)submitbtn2
{
    if(!_submitbtn2)
    {
        _submitbtn2 = [[UIButton alloc] init];
        _submitbtn2.frame = CGRectMake(100, 140, 100, 50);
        [_submitbtn2 addTarget:self action:@selector(submitbtnclick2) forControlEvents:UIControlEventTouchUpInside];
        _submitbtn2.backgroundColor = [UIColor blackColor];
    }
    return _submitbtn2;
}


// 必须实现这个方法, 这个是用来回调取值的!
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    newViewController *sec = (newViewController *)object;
    if ([keyPath isEqualToString:@"passingText"]) {
        //取出改变后的新值.
        self.namelab.text = change[@"new"];
        
         NSLog(@"值改变---old:%@---new:%@",change[@"old"],change[@"new"]);
        
        // 注意: 一定要在使用完观察者之后要注销观察者 否则会crash!!!
        [sec removeObserver:self forKeyPath:@"passingText"];
        
    }
   
    
    newViewController2 *vc2 = (newViewController2*)object;
    if ([keyPath isEqualToString:@"typearr"]) {
        //取出改变后的新值.
        id obj = change[@"new"];
        NSLog(@"obj------%@",obj);
        
        [vc2 removeObserver:self forKeyPath:@"typearr"];
    }
   
}

#pragma mark - 实现方法

-(void)submitbtnclick
{
    newViewController *vc = [[newViewController alloc] init];
    [vc addObserver:self forKeyPath:@"passingText" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)submitbtnclick2
{
    newViewController2 *vc = [[newViewController2 alloc] init];
    [vc addObserver:self forKeyPath:@"typearr" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
