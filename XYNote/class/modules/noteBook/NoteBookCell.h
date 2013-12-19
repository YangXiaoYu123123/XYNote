//
//  NoteBookCell.h
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteBookItem.h"

@interface NoteBookCell : UITableViewCell
@property (nonatomic, weak) IBOutlet NoteBookItem *item1;
@property (nonatomic, weak) IBOutlet NoteBookItem *item2;
@property (nonatomic, weak) IBOutlet NoteBookItem *item3;
@property (nonatomic, weak) IBOutlet NoteBookItem *item4;
@property (nonatomic, weak) IBOutlet NoteBookItem *item5;
@property (nonatomic, weak) IBOutlet NoteBookItem *item6;
@property (nonatomic, strong) NSDictionary *noteDic;
@end
