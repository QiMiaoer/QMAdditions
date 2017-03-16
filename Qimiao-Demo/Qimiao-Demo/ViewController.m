//
//  ViewController.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/11.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "ViewController.h"
#import "QMAdditions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor orangeColor];
//    [self testButton];
    [self testLabel];
    [self testImage];
//    [self testUserDefau];
//    [self testJson];
    NSLog(@"%@" , [@"qwer" qm_MD5]);
}

- (void)testJson {
    NSDictionary *dic = @{@"1":@1, @"2":@2, @"3":@3};
    NSLog(@"%@ haha" , [NSObject qm_transitionToJsonWithObject:dic]);
}

- (void)testUserDefau {
    [NSUserDefaults qm_setObject:@"123" forKey:@"key"];
    NSLog(@"%@ haha", [NSUserDefaults qm_objectForKey:@"key"]);
}

- (void)testImage {
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
//    iv.image = [UIImage qm_imageWithRect:iv.bounds imageColor:[UIColor cyanColor] fillColor:self.view.backgroundColor clipCircle:NO];
    UIImage *image = [UIImage imageNamed:@"111"];
    iv.image = [image qm_cilpIconWithRect:iv.bounds fillColor:self.view.backgroundColor boardColor:[UIColor qm_randowColor] boardWidth:3];
//    iv.image = [image qm_zoomImageWithRect:iv.bounds];
//    iv.image = [UIImage qm_snapshotCurrentView:self.view];
//    iv.layer.borderWidth = 5;
//    iv.layer.borderColor = [[UIColor qm_randowColor] CGColor];
    [self.view addSubview:iv];
}

- (void)testLabel {
    UILabel *lab = [UILabel qm_labelWithFrame:CGRectMake(100, 100, 1, 1) text:@"saldkjg" font:[UIFont systemFontOfSize:30] textColor:[UIColor qm_colorWithHex:0xdbb058] backgroundColor:[UIColor qm_colorWithHex:0x234ae32] textAlignment:NSTextAlignmentCenter];
    [self.view addSubview:lab];
}

- (void)testButton {
    UIButton *btn = [UIButton qm_buttonWithFrame:CGRectMake(100, 100, 20, 20) title:@"kalsdjgas;ldgk" font:[UIFont systemFontOfSize:20] titleNormalColor:[UIColor redColor] titleSelectedColor:[UIColor greenColor] titleHighlightedColor:[UIColor blueColor] backgroundColor:[UIColor lightGrayColor] backgroundImage:nil];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction:(UIButton *)btn {
    btn.selected = !btn.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
