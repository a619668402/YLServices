//
//  YLViewController.m
//  YLServices
//
//  Created by 619668402@qq.com on 12/26/2018.
//  Copyright (c) 2018 619668402@qq.com. All rights reserved.
//

#import "YLViewController.h"
#import "YLMBProgressHUD+Toast.h"

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [YLMBProgressHUD showMessageWithView:self.view message:@"test"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
