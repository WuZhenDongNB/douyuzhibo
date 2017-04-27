//
//  MoveDragButton.m
//  buttoDragg
//
//  Created by yons on 16/9/8.
//  Copyright © 2016年 yons. All rights reserved.
//

#import "MoveDragButton.h"

#import <objc/runtime.h>
#define PADDING  5

@interface MoveDragButton ()
@property (nonatomic,assign)CGFloat  offsetX;
@property (nonatomic,assign)CGFloat  offsetY;
@property(nonatomic,assign) CGPoint beginPoint;


@end
@implementation MoveDragButton

CGPoint  beginPoint;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    self.highlighted = YES;
    if (!self.dragEnable) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    
  _beginPoint = [touch locationInView:self];
    // [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.highlighted = NO;
    if (!self.dragEnable) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint nowPoint = [touch locationInView:self];
    float offsetX = nowPoint.x - _beginPoint.x;
    float offsetY = nowPoint.y - _beginPoint.y;
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);

    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beginPoint.x;
      
    
    if (fabs(offsetX ) == 0) {
       //  [self sendActionsForControlEvents:UIControlEventTouchUpInside];
        self.highlighted = YES;
    }
    
    if (self.highlighted) {
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
        self.highlighted = NO;
    }
    
    if (self.superview && self.adsorbEnable ) {
        float marginLeft = self.frame.origin.x;
        float marginRight = self.superview.frame.size.width - self.frame.origin.x - self.frame.size.width;
        float marginTop = self.frame.origin.y;
        float marginBottom = self.superview.frame.size.height - self.frame.origin.y - self.frame.size.height;
        [UIView animateWithDuration:0.2 animations:^(void){
            if (marginTop<60) {
                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
                                        PADDING,
                                        self.frame.size.width,
                                        self.frame.size.height);
            }
            else if (marginBottom<60) {
                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
                                        self.superview.frame.size.height - self.frame.size.height-PADDING,
                                        self.frame.size.width,
                                        self.frame.size.height);
                
            }
            else {
                self.frame = CGRectMake(marginLeft<marginRight?PADDING:self.superview.frame.size.width - self.frame.size.width-PADDING,
                                        self.frame.origin.y,
                                        self.frame.size.width,
                                        self.frame.size.height);
            }
        }];
        
    }

    
}


@end
