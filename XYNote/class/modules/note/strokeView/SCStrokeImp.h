//
//  SCStrokeDelegate.h
//  SCStroke
//
//  Created by parire parire on 11-5-9.
//  Copyright 2011 河北师范大学软件学院. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SCStrokeView.h"

@class SCStrokeView;
@interface SCStrokeImp : NSObject<StrokeDelegate> {
    CGContextRef   bitmapContext;
    CGFloat        width;
    CGFloat height;
    CGFloat lastStrokeWidth;
    CGFloat defaultStrokeWith;
}
@property CGContextRef  bitmapContext;
@property CGFloat width;
@property CGFloat height;

-(id)initWithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight;
-(CGContextRef)CreateBitmapContextwithWidth:(int)aWidth
                                  andHeight:(int)aHeight;
-(void)strokeView:(SCStrokeView*)aView 
     drawLineFrom:(CGPoint)aStart
            andTo:(CGPoint)aEnd;
-(void)updateView:(SCStrokeView*)aView withContext:(CGContextRef) context;
- (void) drawLineFrom:(CGPoint)aStart andTo:(CGPoint)aEnd;
- (CGFloat)getStepWidth:(CGFloat)aBeginWidth 
            andEndWidth:(CGFloat)aEndWidth
            andDistance:(CGFloat)aDistance
          andStepLength:(CGFloat)aLength;
- (CGFloat)getDistanceFrom: (CGPoint)aStart
					 andTo: (CGPoint)aEnd;
- (NSMutableArray*)getPointSetWithFrom:(CGPoint)aStart
								 andTo:(CGPoint)aEnd;
- (CGFloat)getLineSlopeWithFrom:(CGPoint)aStart
						  andTo:(CGPoint)aEnd;
@end
