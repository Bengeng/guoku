//
//  BuyViewController.m
//  GuoKu
//
//  Created by BEN on 16/6/3.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "BuyViewController.h"

@interface BuyViewController ()
{
    UIWebView *webView;
}
@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ItemDAO *item = [self.myGoods.content.entity.item_listArr firstObject];
    NSURL *buyURL = [NSURL URLWithString:item.buy_link];
    UIButton *bakcBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bakcBtn.frame = CGRectMake(10, 20, 25, 25);
    [bakcBtn setBackgroundImage:[UIImage imageNamed:@"light_back"] forState:UIControlStateNormal];
    [bakcBtn  addTarget:self action:@selector(backToBefore:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"ppleSDGothicNeo-Bold" size:15];
    label.textColor = [UIColor blackColor];
    label.text = @"宝贝详情";
    label.frame = CGRectMake(100, 20, 100, 30);
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(SCREEN_WIDTH - 40, 20, 25, 25);
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick:)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    [self.view addSubview:bakcBtn];
    [self.view addSubview:label];
    [self.view addSubview:closeBtn];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT - 50)];
    
    
    [webView loadRequest:[NSURLRequest requestWithURL:buyURL]];
    
    [self.view addSubview:webView];
    
    
}
- (void)backToBefore:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)closeBtnClick:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

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
