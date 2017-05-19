//
//  ViewController.m
//  JustModelJsonTransform
//
//  Created by Just on 2017/5/19.
//  Copyright © 2017年 Just. All rights reserved.
//

#import "ViewController.h"
#import "JustModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSDictionary *dict = @{
                           @"name" : @"刘阿猛",
                           @"age"  : @25,
                           @"occupation" : @"程序员",
                           @"nationality" : @"天朝"
                           };
    JustModel *model = [[JustModel alloc] initWithDict:dict];
    NSLog(@"%@，今年%@，职业：%@，祖籍：%@",model.name,model.age,model.occupation,model.nationality);
    
    NSDictionary *info = [model covertToDict];
    NSLog(@"%@",info);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
