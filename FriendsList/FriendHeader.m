//
//  FriendHeader.m
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "FriendHeader.h"
#import "FriendGroup.h"

@implementation FriendHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype) friendHeaderWithTableView:(UITableView *) tableView {
    static NSString *ID = @"friendHeader";
    FriendHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (nil == header) {
        header = [[self alloc] initWithReuseIdentifier:ID];
    }
    
    return header;
}

/** 重写初始化方法, 给header加上图标、组名、在线人数等子控件 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    // 必须先调用super的方法
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 1.添加背景按钮
        // 1.1背景
        UIButton *headerButtonView = [[UIButton alloc] init];
        
        // 改变箭头填充方式为居中
        [headerButtonView.imageView setContentMode:UIViewContentModeCenter];
        // 不需要裁剪箭头图片的边界
        [headerButtonView.imageView setClipsToBounds:NO];
        
        [headerButtonView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [headerButtonView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        // 1.2图标
        // 水平左对齐
        headerButtonView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        // 设置内边距
        headerButtonView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        // 设置图片
        [headerButtonView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        // 1.3组名
        [headerButtonView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        headerButtonView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        // 1.4点击事件
        [headerButtonView addTarget:self action:@selector(headerClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:headerButtonView];
        self.headerButtonView = headerButtonView;
        
        // 2.在线人数/好友数
        UILabel *onlineCountView = [[UILabel alloc] init];
        [onlineCountView setTextColor:[UIColor grayColor]];
        [onlineCountView setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:onlineCountView];
        self.onlineCountView = onlineCountView;
    }
    
    return self;
}

/** 子控件布局方法 
    在init的时候，只分配的内存，没有初始化控件的尺寸，在此处header已经有了位置尺寸了
 */
- (void)layoutSubviews {
    // 必须先调用父类的方法
    [super layoutSubviews];
    
    // 1.背景
    self.headerButtonView.frame = self.bounds;
    
    // 2.在线人数/组内总人数
    CGFloat countWidth = 150;
    CGFloat countHeight = self.frame.size.height;
    CGFloat countX = self.frame.size.width - 10 - countWidth;
    CGFloat countY = 0;
    self.onlineCountView.frame = CGRectMake(countX, countY, countWidth, countHeight);
}

/** 加载数据  */
- (void)setFriendGroup:(FriendGroup *)friendGroup {
    _friendGroup = friendGroup;
    
    // 1组名
    [self.headerButtonView setTitle:friendGroup.name forState:UIControlStateNormal];
    
    // 2.在线人数/好友数
    self.onlineCountView.text = [NSString stringWithFormat:@"%d/%d", friendGroup.online, friendGroup.friends.count];
}

/** 点击事件 */
- (void) headerClicked {
    // 1.伸展、隐藏组内好友
    self.friendGroup.opened = !self.friendGroup.isOpened;
    
    // 2.刷新tableView
    if ([self.delegate respondsToSelector:@selector(friendHeaderDidClickedHeader:)]) {
        [self.delegate friendHeaderDidClickedHeader:self];
    }

}

/** 
    被加到父控件之前 
    由于tableView刷新数据后，所有header会被重新创建，所以要在这里对箭头朝向做出修改
 */
- (void)didMoveToSuperview {
    // 改变箭头朝向，顺时针旋转90度
    CGFloat rotation = self.friendGroup.isOpened? M_PI_2 : 0;
    self.headerButtonView.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

@end
