//
//  ViewController.m
//  ipodGDemo
//
//  Created by Admin on 04/03/19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ViewController.h"
#include "sample.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int result = fg(1, 1);
    NSLog(@"MSg:%d",result);
}


@end
