#import <UIKit/UIKit.h>

@protocol StrokeDelegate;
@interface SCStrokeView : UIView {
    CGPoint        firstTouch;
    CGPoint        lastTouch;
    id<StrokeDelegate> trokeDelegate;
    CGFloat        strokeWidth;
    UIColor*       strokeColor;
}
@property CGPoint firstTouch;
@property CGPoint lastTouch;
@property CGContextRef  bitmapContext;
@property (nonatomic,assign) id strokeDelegate;
@property CGFloat  strokeWidth;
@property (nonatomic,retain) UIColor* strokeColor;

@end

@protocol StrokeDelegate

@required
-(void)strokeView:(SCStrokeView*)aView
     drawLineFrom:(CGPoint)aStart
            andTo:(CGPoint)aEnd;
-(void)updateView:(SCStrokeView*)aView withContext:(CGContextRef) context;
@end