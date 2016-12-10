//
//  UIView+Attributes.h
//  Paopao
//
//  Created by tb on 16/10/28.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Attributes)

/**
 *  View.origin.x
 */
@property (nonatomic, assign) CGFloat x;

/**
 *  View.origin.y
 */
@property (nonatomic, assign) CGFloat y;

/**
 *  width
 */
@property (nonatomic, assign) CGFloat width;

/**
 *  height
 */
@property (nonatomic, assign) CGFloat height;

/**
 *  size
 */
@property (nonatomic, assign) CGSize size;

/**
 *  origin
 */
@property (nonatomic, assign) CGPoint origin;

/**
 *  centerX
 */
@property(nonatomic,assign) CGFloat centerX;
/**
 *  centerY
 */
@property(nonatomic,assign) CGFloat centerY;
/**
 *  top
 */
@property (nonatomic,assign) CGFloat top;
/**
 *  bottom
 */
@property (nonatomic,assign) CGFloat bottom;
/**
 *  left
 */
@property (nonatomic,assign) CGFloat left;
/**
 *  right
 */
@property (nonatomic,assign) CGFloat right;

/**
 *  圆角设置
 */
@property (nonatomic,assign) CGFloat radius;

@end
