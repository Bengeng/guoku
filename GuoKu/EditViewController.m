//
//  EditViewController.m
//  GuoKu
//
//  Created by BEN on 16/5/25.
//  Copyright © 2016年 庚杨. All rights reserved.
/*
 字典的健 －－ 值， 值可以改变吗？这样相同的健会有不同的值、
 static NSMutableDictionary *picture;
 UIImage *image =  [info objectForKey:@"UIImagePickerControllerOriginalImage"];
 
 if (picture == nil) {
 picture = [NSMutableDictionary dictionaryWithObject:image forKey:@"headImage"];
 [cellrigthArray addObject:picture];
 
 }
 UIImage *image1 = [cellrigthArray firstObject][@"headImage"];
 image1 = image;
 
 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
 
 先执行父类的方法，父类的viewDidLoad －－－》子类的viewDidLoad －－－》父类的 viewWillAppear －－－》,之所以这样，是因为 ［super 调用父类的方法
 */

#import "EditViewController.h"
#import "EditTableViewCell.h"
#import "HeadPictureTableViewCell.h"
#import "YGSandBoxData.h"
#import "NickNameViewController.h"
#import "AddressChoicePickerView.h"
#import "IntroduceViewController.h"
#import "SVPullToRefresh.h"
@interface EditViewController ()<YGNavigationDelegate,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIImagePickerControllerDelegate>

{
    UITableView    *mainTableView;
    NSMutableArray *pathArray;
    UIPickerView   *provincePickerView;
    
}
@property (nonatomic, strong)  NSArray  *cellTitleArray;

@end
@implementation EditViewController
- (NSArray *)cellTitleArray
{
    if ( _cellTitleArray == nil ) {
        //.plist 数组里存了字典
        _cellTitleArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"EditPage_cellTitle.plist" ofType:nil]];
    }
    return _cellTitleArray;
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self gainData];
    [mainTableView reloadData];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"编辑个人资料";
    self.delegate = self;
    CGFloat hight = EVERY_TITLE_WIDTH * (self.cellTitleArray.count - 1) + 15 + 80;
    
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, EVERY_TITLE_WIDTH, SCREEN_WIDTH, hight) style:UITableViewStylePlain];
    mainTableView.showsVerticalScrollIndicator = NO;
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.bounces = NO;
    mainTableView.scrollEnabled = NO;
    [mainTableView registerClass:[EditTableViewCell class] forCellReuseIdentifier:@"cellIdentifer"];
    [mainTableView registerClass:[HeadPictureTableViewCell class] forCellReuseIdentifier:@"headPictureIdentifer"];
    [self.view addSubview:mainTableView];
    [self gainData];
}

- (void)gainData{
    NSString *imagePath = [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTIMAGE];
    NSString *nickNametPath = [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTNICKNAME]  encoding:NSUTF8StringEncoding error:nil];
    NSString *sexPath =  [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTSEX]  encoding:NSUTF8StringEncoding error:nil];
    NSString *addressPath = [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTADDRESS]  encoding:NSUTF8StringEncoding error:nil];
    NSString *introducePath =  [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTINTRODUCE]  encoding:NSUTF8StringEncoding error:nil];
    
    pathArray = [NSMutableArray arrayWithObjects:
                      imagePath,
                      nickNametPath,
                      sexPath,
                      addressPath,
                      introducePath, nil];
    
}

#pragma --mark  UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 80;
    }
    else{
        return 44;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else{
        return self.cellTitleArray.count - 1;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"cellIdentifer";
    static NSString *headPictureIdentifer = @"headPictureIdentifer";
    if (indexPath.section == 0) {
        HeadPictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:headPictureIdentifer];
        
        if ( cell == nil) {
            cell = [[HeadPictureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headPictureIdentifer];
        }
        cell.textLabel.text = self.cellTitleArray[indexPath.row][@"cell_title"];
        cell.headImageView.image = [UIImage imageWithContentsOfFile:[pathArray objectAtIndex:indexPath.row]];
        return cell;
    }
    else{
        EditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if ( cell == nil ) {
            cell = [[EditTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.rightLabel.text = [pathArray objectAtIndex:(indexPath.row + 1)];
        cell.textLabel.text = self.cellTitleArray[indexPath.row + 1][@"cell_title"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //头像
        UIActionSheet *pictureSheet = [[UIActionSheet alloc]
                                       initWithTitle:nil
                                       delegate:self
                                       cancelButtonTitle:@"取消"
                                       destructiveButtonTitle:nil
                                       otherButtonTitles:@"拍照",@"照片库", nil];
        pictureSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
        pictureSheet.delegate = self;
        pictureSheet.tag = 100;
        [pictureSheet showInView:self.view];
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //昵称
            NickNameViewController *nickName = [[NickNameViewController alloc] init];
            [self.navigationController pushViewController:nickName animated:YES];
        }
        if (indexPath.row == 1) {
            //性别
            UIActionSheet *sexSheet = [[UIActionSheet alloc]
                                       initWithTitle:nil
                                       delegate:self
                                       cancelButtonTitle:@"取消"
                                       destructiveButtonTitle:nil
                                       otherButtonTitles:@"男",@"女", nil];
            sexSheet.tag = 101;
            [sexSheet showInView:self.view];
            
        }
        if (indexPath.row == 2) {
            //所在地
            AddressChoicePickerView *addressPickerView = [[AddressChoicePickerView alloc]init];
            [addressPickerView show];
            addressPickerView.block = ^(AddressChoicePickerView *view,UIButton *btn,AreaObject *locate){
                NSString *address = [NSString stringWithFormat:@"%@",locate];
                [YGSandBoxData saveString:address withName:CURRENTADDRESS];
                NSIndexPath *indexPath=[NSIndexPath indexPathForRow:2 inSection:1];
                [self gainData];
                [mainTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
            };
            
        }
        if (indexPath.row == 3) {
            //简介
            IntroduceViewController *introduce = [[IntroduceViewController alloc] init];
            [self.navigationController pushViewController:introduce animated:YES];
            
        }
    }
}
#pragma  --mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 100) {
        if (buttonIndex == 0) {
            NSLog(@"拍照");
        }
        if (buttonIndex == 1) {
            NSLog(@"照片库");
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        
    }
    if (actionSheet.tag == 101) {
        if (buttonIndex == 0) {
            [YGSandBoxData saveString:@"男" withName:CURRENTSEX];
            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:1];
            [self gainData];
            [mainTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        }
        if (buttonIndex == 1) {
            [YGSandBoxData saveString:@"女" withName:CURRENTSEX];
            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:1];
            [self gainData];
            [mainTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        }
    }
}
#pragma --mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image =  [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [YGSandBoxData saveImage:image withName:CURRENTIMAGE];
    
    [mainTableView reloadData];
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
}
#pragma  --mark YGNavigationDelegate
- (void)ygPerson:(YGNavigationController *)ygPerson backToBefore:(NSString *)backTitle{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 3;
}
#pragma mark - 该方法的返回值决定该控件指定列包含多少个列表项
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0)
    {
        return  3;
    }
    if (component == 1) {
        
        return 4;
    }else{
        return  5;
    }
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
