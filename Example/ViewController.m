//
//  ViewController.m
//  Example
//
//  Created by 龙鹏飞 on 2017/1/6.
//  Copyright © 2017年 https://github.com/LongPF/AspectsCocoa. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+AOPObserver.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.label = [UILabel new];
    
    [self.label addObserver:self forSelector:@selector(setText:) withBlock:^(AOPObserverInfo *info,NSString *text){
        NSLog(@"text = %@",text);
    }];
    
    [self.label addObserver:self forSelector:@selector(drawTextInRect:) withBlock:^(AOPObserverInfo *info,NSValue *rectValue){
        
        NSLog(@"rectValue = %@",rectValue);
        
    }];
    
}

- (IBAction)invoke:(id)sender {
    
    self.label.text = @"666";
    [self.label drawTextInRect:CGRectZero];
    
}

- (IBAction)remove:(id)sender {
    
    [self.label removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
