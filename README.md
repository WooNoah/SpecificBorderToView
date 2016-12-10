
###前言
>最近自定义了一个View，里边要求使用excel表格样式的布局来显示一些数据，这里我使用了多个Label来实现，本来是使用给label加边框，来达到这种效果，四周的边框效果还行，但是中间那些挨着的边框，重叠起来，颜色会加重，所以这里实现了一个UIView的category，用来添加特定数量的border。

###实现
```
typedef NS_ENUM(NSInteger, UIViewBorderDirection) {
UIViewBorderTop      = 1 << 0,
UIViewBorderLeft     = 1 << 1,
UIViewBorderBottom   = 1 << 2,
UIViewBorderRight    = 1 << 3
};

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
```

####要点
这里采用了左移的方式来定义枚举，以达到多个枚举同时选择，可以进行相应的`与或`运算
