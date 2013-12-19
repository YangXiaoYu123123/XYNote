//
//  NoteBookCell.m
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import "NoteBookCell.h"

@implementation NoteBookCell

- (id)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] objectAtIndex:0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNoteDic:(NSDictionary *)noteDic{
    _noteDic = noteDic;
    self.item1.note = [noteDic objectForKey:@"item1"];
    self.item2.note = [noteDic objectForKey:@"item2"];
    self.item3.note = [noteDic objectForKey:@"item3"];
    self.item4.note = [noteDic objectForKey:@"item4"];
    self.item5.note = [noteDic objectForKey:@"item5"];
    self.item6.note = [noteDic objectForKey:@"item6"];
}

@end
