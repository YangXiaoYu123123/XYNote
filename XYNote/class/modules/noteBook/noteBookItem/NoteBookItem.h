//
//  NoteBookItem.h
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NoteBookItem : UIView
@property (nonatomic, weak) IBOutlet UIImageView *noteImg;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) Note *note;
@end
