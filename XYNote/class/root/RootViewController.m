//
//  RootViewController.m
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import "RootViewController.h"
#import "NoteViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) NoteViewController *noteController;
@end

@implementation RootViewController

- (id)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.noteController = [[NoteViewController alloc] init];
    [self.view addSubview:self.noteController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
