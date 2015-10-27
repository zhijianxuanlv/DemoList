//
//  ViewController.m
//  Autolayout
//
//  Created by 金 聖輝 on 12-9-25.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    [UIView animateWithDuration:3 animations:^{
        [self.view removeConstraint:self.topSpace];//先删除原有的对于顶部的约束
        //接下来通过代码添加一个约束
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100]];
        [self.view layoutIfNeeded];//最后使用layoutifneeded方法来从新定义约束，并且产生动画
    }];
}
@end
