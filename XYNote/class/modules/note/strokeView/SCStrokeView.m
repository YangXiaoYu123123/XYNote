//
//  SCStrokeView.m
//  SCStroke
//
//  Created by parire parire on 11-5-9.
//  Copyright 2011 河北师范大学软件学院. All rights reserved.
//

#import "SCStrokeView.h"

@implementation SCStrokeView
@synthesize firstTouch;
@synthesize lastTouch;
@synthesize bitmapContext;
@synthesize strokeDelegate;
@synthesize strokeColor;
@synthesize strokeWidth;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        strokeColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    NSLog(@"rect = %@",NSStringFromCGRect(rect));
    CGContextRef context = UIGraphicsGetCurrentContext();
    [strokeDelegate updateView:self withContext:context];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    UITouch *touch = [touches anyObject];
    firstTouch = [touch locationInView:self];
    lastTouch = [touch locationInView:self];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    
    [strokeDelegate strokeView:self drawLineFrom:firstTouch andTo:lastTouch];
    firstTouch = lastTouch;
    [self setNeedsDisplay];
}
@end
