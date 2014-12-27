//
//  FriendCell.h
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Friend;

@interface FriendCell : UITableViewCell

@property(nonatomic, strong) Friend *friendData;

+ (instancetype) cellWithTableView:(UITableView *) tableView;

@end
