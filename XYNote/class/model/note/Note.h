//
//  note.h
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *editDate;
@property (nonatomic, strong) NSArray *contentArr;
@end
