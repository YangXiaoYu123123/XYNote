//
//  NoteViewController.m
//  XYNote
//
//  Created by tvie on 13-12-19.
//  Copyright (c) 2013年 YXY. All rights reserved.
//

#import "NoteViewController.h"
#import "SCStrokeView.h"
#import "SCStrokeImp.h"

@interface NoteViewController ()
@property (nonatomic, strong) SCStrokeView *strokeView;
@property (nonatomic, strong) SCStrokeImp *strokeImp;
@end

@implementation NoteViewController

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
    self.strokeView = [[SCStrokeView alloc] initWithFrame:self.view.bounds];
    self.strokeImp = [[SCStrokeImp alloc] initWithWidth:self.view.frame.size.width andHeight:self.view.frame.size.height];
    self.strokeView.strokeDelegate = self.strokeImp;
    [self.view addSubview:self.strokeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
