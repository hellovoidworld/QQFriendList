//
//  FriendCell.m
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "FriendCell.h"
#import "Friend.h"

@implementation FriendCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/** 自定义构造方法 */
+ (instancetype) cellWithTableView:(UITableView *) tableView {
    static NSString *ID = @"friendCell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

/** 加载数据 */
- (void)setFriendData:(Friend *)friendData {
    _friendData = friendData;
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.isVip?[UIColor redColor]:[UIColor blackColor];
    self.detailTextLabel.text = friendData.intro;
}

@end
