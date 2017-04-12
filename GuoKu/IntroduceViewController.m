//
//  IntroduceViewController.m
//  GuoKu
//
//  Created by BEN on 16/5/30.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "IntroduceViewController.h"

#import "YGSandBoxData.h"
@interface IntroduceViewController ()<YGNavigationDelegate,UITextFieldDelegate>
{
    UITextField  *introduce;
}
@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"简介";
    self.delegate = self;
    self.showSaveButton = YES;
    
    introduce = [[UITextField  alloc] initWithFrame: CGRectMake(5, EVERY_TITLE_WIDTH + 30, SCREEN_WIDTH - 10 , 80)];
    introduce.delegate = self;
    introduce.borderStyle = UITextBorderStyleRoundedRect;
    introduce.autocorrectionType = UITextAutocorrectionTypeYes;
    introduce.returnKeyType = UIReturnKeyDone;
    introduce.placeholder = @"请填写您的个人简介";
    introduce.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:introduce];
    
}
#pragma  --mark UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  --mark YGNavigationDelegate
- (void)ygPerson:(YGNavigationController *)ygPerson backToBefore:(NSString *)backTitle{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)ygPerson:(YGNavigationController *)ygPerson saveButton:(NSString *)backTitle{
    
    [YGSandBoxData saveString:introduce.text withName:CURRENTINTRODUCE];
    
    [self.navigationController popViewControllerAnimated:YES];
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
