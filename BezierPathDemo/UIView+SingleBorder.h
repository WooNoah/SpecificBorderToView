//
//  UIView+SingleBorder.h
//  BezierPathDemo
//
//  Created by 吴迪 on 16/12/10.
//  Copyright © 2016年 吴迪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIViewBorderDirection) {
    UIViewBorderTop      = 1 << 0,
    UIViewBorderLeft     = 1 << 1,
    UIViewBorderBottom   = 1 << 2,
    UIViewBorderRight    = 1 << 3
};

@interface UIView (SingleBorder)

/**
 *  给view添加单个border
 *  @param direct 添加的位置
 *  @param clr 边框的颜色
 *  @param wid 边框的宽度
 */
- (void)addLineWithDirection:(UIViewBorderDirection)direct color:(UIColor *)clr width:(CGFloat)wid;


/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
- (void)addSingleBorder:(UIViewBorderDirection)direct color:(UIColor *)color width:(CGFloat)width;

@end
