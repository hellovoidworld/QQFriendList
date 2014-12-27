//
//  FriendGroup.m
//  FriendsList
//
//  Created by hellovoidworld on 14/12/12.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"

@implementation FriendGroup

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
        
        NSMutableArray *mFriendsArray = [NSMutableArray array];
        for (NSDictionary *friendDict in self.friends) {
            Friend *friend = [Friend friendWithDictionary:friendDict];
            [mFriendsArray addObject:friend];
        }
        
        self.friends = mFriendsArray;
    }
    
    return self;
}

+ (instancetype) friendGroupWithDictionary:(NSDictionary *) dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

@end
