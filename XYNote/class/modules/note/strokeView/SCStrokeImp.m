//
//  SCStrokeDelegate.m
//  SCStroke
//
//  Created by parire parire on 11-5-9.
//  Copyright 2011 河北师范大学软件学院. All rights reserved.
//

#import "SCStrokeImp.h"
#import "SCStrokeView.h"


static const CGFloat kDefaultLineWidth = 1;
static const CGFloat kThresholdKare = 10;
static const CGFloat kThresholdTech = 120;

@implementation SCStrokeImp
@synthesize bitmapContext;
@synthesize width;
@synthesize height;

-(id)initWithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight
{
    if(self = [super init])
    {
        width = aWidth;
        height = aHeight;
        bitmapContext = [self CreateBitmapContextwithWidth:aWidth andHeight:aHeight];
        CGContextSetLineWidth(bitmapContext, 5.0);
        CGContextSetStrokeColorWithColor(bitmapContext, [UIColor redColor].CGColor); 
        CGContextSetLineJoin(bitmapContext, kCGLineJoinRound);
        CGContextSetLineCap(bitmapContext,kCGLineCapRound);
    }
    return self;
}
-(CGContextRef)CreateBitmapContextwithWidth:(int) pixelsWide
                                  andHeight:(int)pixelsHigh
{
    CGContextRef    context = NULL;
    void *          bitmapData = NULL;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    context = CGBitmapContextCreate (bitmapData,pixelsWide,
                                     pixelsHigh,8,      
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     1);
    
    return context;
}
-(void)strokeView:(SCStrokeView*)aView drawLineFrom:(CGPoint)aStart
            andTo:(CGPoint)aEnd
{
    CGColorRef color = [aView.strokeColor CGColor];
	const CGFloat *components = CGColorGetComponents(color);	
	CGContextSetRGBFillColor( bitmapContext, components[0], components[1], components[2], 1 );
	defaultStrokeWith = aView.strokeWidth;
    
    [self drawLineFrom:aStart andTo:aEnd];
    
}
-(void)updateView:(SCStrokeView*)aView withContext:(CGContextRef) context
{
    CGRect imageRect = CGRectMake(0,0,width,height);
    CGImageRef image = CGBitmapContextCreateImage (bitmapContext);
    CGContextDrawImage(context, imageRect, image);
}

- (CGFloat)getLineWithFrom:(CGPoint)aStart
					 andTo:(CGPoint)aEnd
{
	CGFloat distance = sqrt((aStart.x - aEnd.x)*(aStart.x-aEnd.x) 
                            + (aStart.y - aEnd.y)*(aStart.y-aEnd.y));
	CGFloat currentStrokeWidth = 
        kThresholdKare*(kThresholdTech-distance)/kThresholdTech 
        + defaultStrokeWith;
    
    if( currentStrokeWidth != lastStrokeWidth )
		currentStrokeWidth = (lastStrokeWidth + currentStrokeWidth)/2; 
	
	return currentStrokeWidth;
}
- (CGFloat)getLineSlopeWithFrom:(CGPoint)aStart
						  andTo:(CGPoint)aEnd
{
	if( aStart.x == aEnd.x || aStart.y == aEnd.y )
		return 0;
	
	return (aStart.x-aEnd.x)/(aStart.y-aEnd.y);
}
- (NSMutableArray*)getPointSetWithFrom:(CGPoint)aStart
								 andTo:(CGPoint)aEnd
{
	CGFloat lineSlot = [self getLineSlopeWithFrom:aStart andTo:aEnd];
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
	if( abs(lineSlot) < 1 && aStart.y != aEnd.y )
	{
		//A&E&D&H:
		for( NSInteger pos = 0; pos < abs(aStart.y - aEnd.y); ++pos)
		{
			CGFloat distance = lineSlot*pos;
			CGFloat x = 0;
			CGFloat y = 0;
			
			if( aStart.x > aEnd.x )
			    x = aStart.x - abs(distance);
			else 
				x = aStart.x + abs(distance);
            
			
			if( aStart.y > aEnd.y )
				y = aStart.y - pos;
			else 
				y = aStart.y + pos;
            
			NSValue* ptValue = [NSValue valueWithCGPoint:CGPointMake(x,y)];
			[array addObject:ptValue ];
		}
	}
	else if( abs(lineSlot) >= 1 || aStart.y == aEnd.y )
	{
		//B&F&C&G:
		CGFloat negLineSlot = (aStart.y-aEnd.y)/(aStart.x-aEnd.x);
		for( NSInteger pos = 0; pos < abs(aStart.x - aEnd.x); ++ pos)
		{
			CGFloat x = 0;
			CGFloat y = 0;
			CGFloat distance = negLineSlot*pos;
			
			if(aStart.x > aEnd.x)
				x = aStart.x - pos;
			else 
				x = aStart.x + pos;
            
			if(aStart.y > aEnd.y)
			    y = aStart.y - abs(distance);
			else 
                y = aStart.y + abs(distance);
			
			NSValue* ptValue = [NSValue valueWithCGPoint:CGPointMake(x,y)];
			[array addObject:ptValue];
		}
	}
	return array;
}
- (CGFloat)getDistanceFrom: (CGPoint)aStart
					 andTo: (CGPoint)aEnd
{
	CGFloat distance = sqrt((aStart.x - aEnd.x)*(aStart.x - aEnd.x) + (aStart.y - aEnd.y)*(aStart.y - aEnd.y));
	return distance;
}


- (CGFloat)getStepWidth:(CGFloat)aBeginWidth 
			   andEndWidth:(CGFloat)aEndWidth
			   andDistance:(CGFloat)aDistance
             andStepLength:(CGFloat)aLength

{
	CGFloat stepWidth = aBeginWidth + aLength*(aEndWidth - aBeginWidth)/aDistance;
	return stepWidth;
}

- (void) drawLineFrom:(CGPoint)aStart andTo:(CGPoint)aEnd
{
    CGFloat distance = [self getDistanceFrom:aStart andTo: aEnd];
	
    CGFloat strokeWidth = [self getLineWithFrom:aStart andTo:aEnd];
    NSArray *array = [self getPointSetWithFrom: aStart andTo: aEnd];
    for( NSInteger seq = 0; seq < [array count]; seq++)
    {
        NSValue *ptValue = [array objectAtIndex: seq];
		
        CGPoint point = [ptValue CGPointValue];
        CGFloat stepLength = [self getDistanceFrom:aStart andTo:point];
        CGFloat stepWidth = [self getStepWidth:lastStrokeWidth
                                   andEndWidth:strokeWidth
                                   andDistance:distance
                                 andStepLength:stepLength];
        
        CGRect rect = CGRectMake( point.x-stepWidth, 
             point.y-stepWidth,1,1);
        CGContextFillEllipseInRect( bitmapContext, rect );
    }
    lastStrokeWidth = strokeWidth;
}

@end

