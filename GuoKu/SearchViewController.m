//
//  SearchViewController.m
//  GuoKu
//
//  Created by 张泉 on 15-11-1.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>
{
    UISearchBar *benSearchBar;
}
@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSearchBar];
    [self initCancelButton];
}
- (void)initSearchBar
{
    benSearchBar = [[UISearchBar  alloc] initWithFrame:CGRectMake(0, 0, 320,40)];
    benSearchBar.placeholder = @"搜索";
    
    benSearchBar.showsCancelButton = YES;
    UIView *barBackGround = [benSearchBar.subviews objectAtIndex:0];
    [barBackGround removeFromSuperview];
    benSearchBar.backgroundColor = [UIColor colorWithRed:196.0/225 green:247.0/225 blue:1 alpha:0.8];
    benSearchBar.delegate = self;
    [self.view addSubview:benSearchBar];
    
}
#pragma mark 点击搜索框的时候调用的方法
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}
#pragma mark 改变取消按钮
- (void)initCancelButton
{
   UIButton *cancelButton;
    
    for (UIView *subView in benSearchBar.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            cancelButton = (UIButton*)subView;
        }
    }
    if (cancelButton) {
        //Set the new title of the cancel button
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        cancelButton.tintColor = [UIColor grayColor];
    }

}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
      [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
