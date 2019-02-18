#import <QuartzCore/QuartzCore.h>
#import "UIViewExt.h"
@implementation UIView(UIViewExt)

- (CGFloat)left_l {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft_l:(CGFloat)left_l {
    CGRect frame = self.frame;
    frame.origin.x = left_l;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top_t {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop_t:(CGFloat)top_t {
    CGRect frame = self.frame;
    frame.origin.y = top_t;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right_r {
    return self.frame.origin.x + self.width_w;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight_r:(CGFloat)right_r{
    CGRect frame = self.frame;
    frame.origin.x = right_r - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom_b {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom_b:(CGFloat)bottom_b {
    CGRect frame = self.frame;
    frame.origin.y = bottom_b - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX_X {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX_X:(CGFloat)centerX_X {
    self.center = CGPointMake(centerX_X, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY_Y {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY_Y:(CGFloat)centerY_Y {
    self.center = CGPointMake(self.center.x, centerY_Y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width_w {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth_w:(CGFloat)width_w {
    CGRect frame = self.frame;
    frame.size.width = width_w;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height_h {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight_h:(CGFloat)height_h {
    CGRect frame = self.frame;
    frame.size.height = height_h;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenX_X {
    CGFloat x = 0;
    for (UIView *view = self; view; view = view.superview){
        x += view.left_l;
    }
    return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenY_Y {
    CGFloat y = 0;
    for (UIView *view = self; view; view = view.superview){
        y += view.top_t;
    }
    return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)screenViewX_X {
    CGFloat x = 0;
    for (UIView *view = self; view; view = view.superview){
        x += view.left_l;
        
        if ([view isKindOfClass:[UIScrollView class]]){
            UIScrollView *scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)screenViewY_Y {
    CGFloat y = 0;
    for (UIView *view = self; view; view = view.superview){
        y += view.top_t;
        
        if ([view isKindOfClass:[UIScrollView class]]){
            UIScrollView *scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y - [UIApplication sharedApplication].statusBarFrame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)screenFrame_F {
    return CGRectMake(self.screenViewX_X, self.screenViewY_Y, self.width_w, self.height_h);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin_o {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin_o:(CGPoint)origin_o {
    CGRect frame = self.frame;
    frame.origin = origin_o;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size_s {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize_s:(CGSize)size_s {
    CGRect frame = self.frame;
    frame.size = size_s;
    self.frame = frame;
}





///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView *child in self.subviews){
        UIView *it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]){
        return self;
    } else if (self.superview){
        return [self.superview ancestorOrSelfWithClass:cls];
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)removeAllSubviews {
    while (self.subviews.count){
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}
//- (UIImage *) imageByRenderingView:(CGRect)f
//{
//    CGFloat scale = [[UIScreen mainScreen] scale];
//    
//    if (NULL != &UIGraphicsBeginImageContextWithOptions)
//        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, scale);
//    else
//        UIGraphicsBeginImageContext(self.bounds.size);
//	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
//	return  UIGraphicsGetImageFromCurrentImageContext();
//    
//}


//#ifdef DEBUG
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)simulateTapAtPoint:(CGPoint)location {
//  UITouch *touch = [[[UITouch alloc] initInView:self location:location] autorelease];
//
//  UIEvent *eventDown = [[[UIEvent alloc] initWithTouch:touch] autorelease];
//  [touch.view touchesBegan:[NSSet setWithObject:touch] withEvent:eventDown];
//
//  [touch changeToPhase:UITouchPhaseEnded];
//
//  UIEvent *eventUp = [[[UIEvent alloc] initWithTouch:touch] autorelease];
//  [touch.view touchesEnded:[NSSet setWithObject:touch] withEvent:eventUp];
//}
//
//#endif


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)offsetFromView:(UIView*)otherView {
    CGFloat x = 0, y = 0;
    for (UIView *view = self; view && view != otherView; view = view.superview){
        x += view.left_l;
        y += view.top_t;
    }
    return CGPointMake(x, y);
}



@end
@implementation UIView(FindFirstResponder)

- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *responder = [subView findFirstResponder];
        if (responder) return responder;
    }
    return nil;
}
- (UIView *)findIsDispalyInScreen
{
    if (self.isHidden) {
        return self;
    }
    for (UIView * subView in self.subviews) {
        UIView * isDisplay = [subView findIsDispalyInScreen];
        if (isDisplay) {
            return isDisplay;
        }
    }
    return nil;
}
@end
