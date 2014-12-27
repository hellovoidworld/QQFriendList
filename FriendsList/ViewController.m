//
//  ViewController.m
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import "FriendGroup.h"
#import "FriendCell.h"
#import "FriendHeader.h"

// 遵守FriendHeaderDelegate协议
@interface ViewController () <FriendHeaderDelegate>

@property(nonatomic, strong) NSArray *friendGroups;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.sectionHeaderHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

/** 加载数据 */
- (NSArray *) friendGroups {
    if (nil == _friendGroups) {
        NSArray *groupsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *mgroupsArray = [NSMutableArray array];
        for (NSDictionary *groupDict in groupsArray) {
            FriendGroup *group = [FriendGroup friendGroupWithDictionary:groupDict];
            [mgroupsArray addObject:group];
        }
        self.friendGroups = mgroupsArray;
    }
    
    return _friendGroups;
}

#pragma mark - dataSource方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendGroups.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FriendGroup *group = self.friendGroups[section];
    // 先检查模型数据内的伸展标识
    return group.isOpened? group.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [FriendCell cellWithTableView:self.tableView];
    FriendGroup *group = self.friendGroups[indexPath.section];
    cell.friendData = group.friends[indexPath.row];
    return cell;
}

/** 自定义每个section的头部 */
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FriendHeader *header = [FriendHeader friendHeaderWithTableView:self.tableView];
    // 加载数据
    header.friendGroup = self.friendGroups[section];
    // 设置代理
    header.delegate = self;
    return header;
}

#pragma mark - FriendHeaderDelegate方法
- (void)friendHeaderDidClickedHeader:(FriendHeader *)header {
    // 刷新数据
    [self.tableView reloadData];
}

@end
