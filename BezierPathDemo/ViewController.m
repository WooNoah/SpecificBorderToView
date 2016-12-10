//
//  ViewController.m
//  BezierPathDemo
//
//  Created by 吴迪 on 16/12/9.
//  Copyright © 2016年 吴迪. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"
#import "Masonry.h"
#import "UIView+SingleBorder.h"


@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *centerBtn;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.centerBtn addLineWithDirection:<#(borderDirection)#> color:<#(UIColor *)#> width:<#(CGFloat)#>]
}


- (IBAction)presentToSecView:(id)sender {
    SecViewController *sec = [[SecViewController alloc]init];
    [self presentViewController:sec animated:YES completion:nil];
}




    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
