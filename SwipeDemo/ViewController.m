//
//  ViewController.m
//  SwipeDemo
//
//  Created by A.Jester on 2018/8/13.
//  Copyright © 2018 AJ. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showDemo:(id)sender {
    DemoViewController *vc = [[DemoViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
