//
//  EnterArticleViewsViewController.m
//  GuoKu
//
//  Created by BEN on 16/6/5.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "EnterArticleViewsViewController.h"

@interface EnterArticleViewsViewController ()
{
     UIWebView *webView;
}
@end

@implementation EnterArticleViewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    /articles/6329/
    //    http://m.guoku.com/articles/6815/
    NSString *completePath = [NSString stringWithFormat:@"http://m.guoku.com%@",self.article.url];
    NSString *Path = [completePath stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *articleURL = [NSURL URLWithString:Path];
   
    self.navigationTitle = @"图文";
    self.delegate = self;
    webView = [[UIWebView alloc] initWithFrame: CGRectMake(0, EVERY_TITLE_WIDTH + 15, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    webView.backgroundColor = BACK_COLOR;
    [webView loadRequest:[NSURLRequest requestWithURL:articleURL]];
    [self.view addSubview:webView];

    
    
}

- (void)ygPerson:(YGNavigationController *)ygPerson backToBefore:(NSString *)backTitle{
    
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
