//
//  Friend.h
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

/** 头像 */
@property(nonatomic, copy) NSString *icon;

/** 介绍 */
@property(nonatomic, copy) NSString *intro;

/** 名字 */
@property(nonatomic, copy) NSString *name;

/** vip标志 */
@property(nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
+ (instancetype) friendWithDictionary:(NSDictionary *) dictionary;

@end
