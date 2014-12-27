//
//  FriendGroup.h
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Friend;

@interface FriendGroup : NSObject

/** 好友组 */
@property(nonatomic, strong) NSArray *friends;

/** 好友组名 */
@property(nonatomic, copy) NSString *name;

/** 在线人数 */
@property(nonatomic, assign) int online;

/** 是否伸展显示好友 */
@property(nonatomic, assign, getter=isOpened) BOOL opened;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
+ (instancetype) friendGroupWithDictionary:(NSDictionary *) dictionary;

@end
