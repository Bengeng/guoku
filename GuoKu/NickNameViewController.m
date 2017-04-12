//
//  NickNameViewController.m
//  GuoKu
//
//  Created by BEN on 16/5/29.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "NickNameViewController.h"
#import "YGSandBoxData.h"
@interface NickNameViewController ()<YGNavigationDelegate,UITextFieldDelegate>
{
    UITextField  *nickName;
}
@end

@implementation NickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"昵称";
    self.delegate = self;
    self.showSaveButton = YES;
    
    nickName = [[UITextField  alloc] initWithFrame: CGRectMake(5, EVERY_TITLE_WIDTH + 30, SCREEN_WIDTH - 10 , EVERY_TITLE_WIDTH)];
    nickName.delegate = self;
    nickName.borderStyle = UITextBorderStyleRoundedRect;
    nickName.autocorrectionType = UITextAutocorrectionTypeYes;
    nickName.returnKeyType = UIReturnKeyDone;
    nickName.placeholder = @"请设置您的昵称";
    nickName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:nickName];
    
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
    
    [YGSandBoxData saveString:nickName.text withName:CURRENTNICKNAME];
    
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
