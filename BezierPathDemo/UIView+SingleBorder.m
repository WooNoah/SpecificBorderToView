//
//  UIView+SingleBorder.m
//  BezierPathDemo
//
//  Created by 吴迪 on 16/12/10.
//  Copyright © 2016年 吴迪. All rights reserved.
//

#import "UIView+SingleBorder.h"
#import "UIView+Attributes.h"

@implementation UIView (SingleBorder)


/**
 *  给view添加单个border
 *  @param direct 添加的方向
 *  @param clr 边框的颜色
 *  @param wid 边框的宽度
 */
- (void)addLineWithDirection:(UIViewBorderDirection)direct color:(UIColor *)clr width:(CGFloat)wid {
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.backgroundColor = clr.CGColor;
    
    CGFloat viewWidth  = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    
    if (direct == UIViewBorderTop) {             //上
        lineLayer.frame = CGRectMake(0, 0, viewWidth, wid);
    }else if (direct == UIViewBorderLeft) {      //左
        lineLayer.frame = CGRectMake(0, 0, wid, viewHeight);
    }else if (direct == UIViewBorderBottom) {    //下
        lineLayer.frame = CGRectMake(0, viewHeight - wid, viewWidth, wid);
    }else if (direct == UIViewBorderRight) {     //右
        lineLayer.frame = CGRectMake(viewWidth - wid, 0, wid, viewHeight);
    }else if (direct == (UIViewBorderTop | UIViewBorderLeft)) {      //上&左
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
    }else if (direct == (UIViewBorderTop | UIViewBorderRight)) {     //上&右
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
    }else if (direct == (UIViewBorderTop | UIViewBorderBottom)) {      //上&下
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
    }
    
    else if (direct == (UIViewBorderLeft | UIViewBorderBottom)) {      //左&下
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
    }else if (direct == (UIViewBorderLeft | UIViewBorderRight)) {      //左&右
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
    }
    
    else if (direct == (UIViewBorderRight | UIViewBorderBottom)) {      //右&下
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
    }
    
    //三个
    else if (direct == (UIViewBorderTop | UIViewBorderLeft | UIViewBorderBottom)) {  //上、左、下
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
    }else if (direct == (UIViewBorderTop | UIViewBorderLeft | UIViewBorderRight)) {  //上、左、右
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
    }else if (direct == (UIViewBorderTop | UIViewBorderRight | UIViewBorderBottom)) {  //上、右、下
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
    }else if (direct == (UIViewBorderLeft | UIViewBorderRight | UIViewBorderBottom)) {  //右、左、下
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
    }
    
    //四个
    else if (direct == (UIViewBorderRight | UIViewBorderTop | UIViewBorderLeft | UIViewBorderBottom)) {
        //为什么不用view.layer.border呢 = =#
        [self addLineWithDirection:UIViewBorderTop color:clr width:wid];
        [self addLineWithDirection:UIViewBorderLeft color:clr width:wid];
        [self addLineWithDirection:UIViewBorderBottom color:clr width:wid];
        [self addLineWithDirection:UIViewBorderRight color:clr width:wid];
    }
    
    [self.layer addSublayer:lineLayer];
}


-(void)addSingleBorder:(UIViewBorderDirection)direct color:(UIColor *)color width:(CGFloat)width{
    
    UIView *line=[[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor=color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views=NSDictionaryOfVariableBindings(line);
    NSDictionary *metrics=@{@"w":@(width),@"y":@(self.height - width),@"x":@(self.width - width)};
    
    
    NSString *vfl_H=@"";
    NSString *vfl_W=@"";
    
    //上
    if(UIViewBorderTop==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:|-0-[line(==w)]";
    }
    
    //左
    if(UIViewBorderLeft==direct){
        vfl_H=@"H:|-0-[line(==w)]";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    //下
    if(UIViewBorderBottom==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:[line(==w)]-0-|";
    }
    
    //右
    if(UIViewBorderRight==direct){
        vfl_H=@"H:[line(==w)]-0-|";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_H options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_W options:0 metrics:metrics views:views]];
}

@end
