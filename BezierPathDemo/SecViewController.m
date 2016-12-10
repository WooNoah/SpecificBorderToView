//
//  SecViewController.m
//  BezierPathDemo
//
//  Created by 吴迪 on 16/12/9.
//  Copyright © 2016年 吴迪. All rights reserved.
//

#import "SecViewController.h"
#import "Masonry.h"
#import "UIView+SingleBorder.h"

#define ViewBorder(View, Width, Color)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//typedef NS_ENUM(NSInteger, UIViewBorderDirection) {
//    UIViewBorderTop      = 1 << 0,
//    UIViewBorderLeft     = 1 << 1,
//    UIViewBorderBottom   = 1 << 2,
//    UIViewBorderRight    = 1 << 3
//};

@interface SecViewController ()

@property (strong, nonatomic) UIButton *testBtn;

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.testBtn = [[UIButton alloc]init];
    [self.testBtn setTitle:@"hello" forState:UIControlStateNormal];
    [self.testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.testBtn setBackgroundColor:[UIColor whiteColor]];
    self.testBtn.frame = CGRectMake(100, 100, 200, 50);
    //也可以使用宏
    ViewBorder(self.testBtn, .5f, [UIColor blackColor]);
    [self.view addSubview:self.testBtn];
    
    //如果使用Masonry,则需要在layoutSubviews里添加
//    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(100);
//        make.left.equalTo(self.view).offset(100);
//        make.size.mas_equalTo(CGSizeMake(200, 50));
//    }];
    
    //可以单独使用这个方法，也可以使用UIView的category
//    [self addSingleLineToView:self.testBtn direction:UIViewBorderTop color:[UIColor greenColor] width:2.5f];

    //也可以使用同时添加多个边框， 使用 '|' 连接
//    [self addSingleLineToView:self.testBtn direction:UIViewBorderLeft | UIViewBorderTop | UIViewBorderBottom color:[UIColor orangeColor] width:2.5f];
    
    UIButton *disBtn = [[UIButton alloc]init];
    [disBtn setTitle:@"dismiss" forState:UIControlStateNormal];
    [disBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [disBtn addTarget:self action:@selector(dismsAction) forControlEvents:UIControlEventTouchUpInside];
    disBtn.frame = CGRectMake(100, 200, 200, 50);
    [self.view addSubview:disBtn];
    
    //UIView的category
    [disBtn addLineWithDirection:UIViewBorderRight | UIViewBorderLeft color:[UIColor redColor] width:2.5f];
    

}

- (void)dismsAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//如果使用Masonry,则需要在layoutSubviews里添加
//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];

//    [self addSingleLineToView:self.testBtn direction:UIViewBorderLeft | UIViewBorderTop | UIViewBorderBottom color:[UIColor orangeColor] width:2.5f];
//}



//可以单独使用这个方法，也可以使用UIView的category
/**
 *  给view添加单个border
 *  @param view 添加单边框的view
 *  @param direct 添加的方向
 *  @param clr 边框的颜色
 *  @param wid 边框的宽度
 */
- (void)addSingleLineToView:(UIView *)view direction:(UIViewBorderDirection)direct color:(UIColor *)clr width:(CGFloat)wid {
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.backgroundColor = clr.CGColor;
    
    CGFloat viewWidth  = view.frame.size.width;
    CGFloat viewHeight = view.frame.size.height;
    
    if (direct == UIViewBorderTop) {             //上
        lineLayer.frame = CGRectMake(0, 0, viewWidth, wid);
    }else if (direct == UIViewBorderLeft) {      //左
        lineLayer.frame = CGRectMake(0, 0, wid, viewHeight);
    }else if (direct == UIViewBorderBottom) {    //下
        lineLayer.frame = CGRectMake(0, viewHeight - wid, viewWidth, wid);
    }else if (direct == UIViewBorderRight) {     //右
        lineLayer.frame = CGRectMake(viewWidth - wid, 0, wid, viewHeight);
    }else if (direct == (UIViewBorderLeft | UIViewBorderTop)) {      //上&左
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
    }else if (direct == (UIViewBorderRight | UIViewBorderTop)) {     //上&右
        [self addSingleLineToView:view direction:UIViewBorderRight color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
    }else if (direct == (UIViewBorderBottom | UIViewBorderTop)) {      //上&下
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
    }
    
    else if (direct == (UIViewBorderBottom | UIViewBorderLeft)) {      //左&下
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
    }else if (direct == (UIViewBorderLeft | UIViewBorderRight)) {      //左&右
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderRight color:clr width:wid];
    }
    
    else if (direct == (UIViewBorderBottom | UIViewBorderTop)) {      //右&下
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
    }
    
    //三个
    else if (direct == (UIViewBorderTop | UIViewBorderLeft | UIViewBorderBottom)) {  //上、左、下
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
    }else if (direct == (UIViewBorderTop | UIViewBorderLeft | UIViewBorderRight)) {  //上、左、右
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderRight color:clr width:wid];
    }else if (direct == (UIViewBorderTop | UIViewBorderRight | UIViewBorderBottom)) {  //上、右、下
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderRight color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
    }else if (direct == (UIViewBorderLeft | UIViewBorderRight | UIViewBorderBottom)) {  //右、左、下
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderRight color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
    }
    
    //四个
    else if (direct == (UIViewBorderRight | UIViewBorderTop | UIViewBorderLeft | UIViewBorderBottom)) {
        //为什么不用view.layer.border呢 = =#
        [self addSingleLineToView:view direction:UIViewBorderTop color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderLeft color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderBottom color:clr width:wid];
        [self addSingleLineToView:view direction:UIViewBorderRight color:clr width:wid];
    }
    
    [view.layer addSublayer:lineLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
