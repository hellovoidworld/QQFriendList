//
//  FriendHeader.h
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendGroup, FriendHeader;

@protocol FriendHeaderDelegate <NSObject>
/** header被点击的代理方法 */
@optional
- (void) friendHeaderDidClickedHeader:(FriendHeader *) header;

@end

@interface FriendHeader : UITableViewHeaderFooterView

/** 包含了箭头图标和组名、背景色的按钮 */
@property(nonatomic, weak) UIButton *headerButtonView;

/** 在线人数 */
@property(nonatomic, weak) UILabel *onlineCountView;

/** group数据 */
@property(nonatomic, strong) FriendGroup *friendGroup;

/** 代理 */
@property(nonatomic, strong) id<FriendHeaderDelegate> delegate;

+ (instancetype) friendHeaderWithTableView:(UITableView *) tableView;

@end
