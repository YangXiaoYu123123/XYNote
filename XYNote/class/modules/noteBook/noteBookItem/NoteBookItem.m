//
//  NoteBookItem.m
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import "NoteBookItem.h"

@implementation NoteBookItem

- (id)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] objectAtIndex:0];
    }
    return self;
}

- (void)setNote:(Note *)note{
    _note = note;
    if (!_note) {
        self.hidden = YES;
        return;
    }
    self.titleLabel.text = _note.title;
    [self.noteImg setImage:[UIImage imageNamed:@""]];
}
@end
