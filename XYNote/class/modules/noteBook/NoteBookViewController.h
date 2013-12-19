//
//  NoteBookViewController.h
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import "BaseViewController.h"

@interface NoteBookViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contentTable;
@end
