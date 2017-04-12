//
//  YGNavigationController.m
//  GuoKu
//
//  Created by BEN on 16/5/25.
//  Copyright © 2016年 庚杨. All rights reserved.
/*
  主要是显示导航栏，如何控制隐藏暂不考虑
 */

#import "YGNavigationController.h"
#import "YGLabel.h"
@interface YGNavigationController ()

@end

@implementation YGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated{
    [self showNavigationBar];

}
- (void)showNavigationBar{
    
    UIButton *bakcBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bakcBtn.frame = CGRectMake(10, 20, 30, 30);
    [bakcBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [bakcBtn  addTarget:self action:@selector(backToBefore:) forControlEvents:UIControlEventTouchUpInside];
    
    YGLabel *label = [[YGLabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = self.navigationTitle;
    CGFloat width = [YGLabel calculateTextWidth:self.navigationTitle];
    label.frame = CGRectMake(SCREEN_WIDTH/2 - width/2, 15, width, EVERY_TITLE_WIDTH);
    UIImageView *lineImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"line"]];
    lineImage.frame = CGRectMake(0, EVERY_TITLE_WIDTH + 20 - 5, SCREEN_WIDTH, 5);
    
    if (self.showSaveButton) {
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        saveBtn.frame = CGRectMake(SCREEN_WIDTH - 80, 15, 60, EVERY_TITLE_WIDTH);
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [saveBtn addTarget:self action:@selector(saveBtnClick:)  forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:saveBtn];
    }
    
    [self.view addSubview:bakcBtn];
    [self.view addSubview:label];
    [self.view addSubview:lineImage];
}
- (void)backToBefore:(UIButton *)button{
    [self.delegate ygPerson:self backToBefore:nil];
}
- (void)saveBtnClick:(UIButton *)button{
    [self.delegate ygPerson:self saveButton:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
