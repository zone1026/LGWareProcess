//
//  ViewController.m
//  swareViewTest
//
//  Created by jamy on 15/6/9.
//  Copyright (c) 2015年 jamy. All rights reserved.
//

#import "ViewController.h"
#import "LGWareView.h"

@interface ViewController ()
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;

@property (nonatomic, strong) LGWareView *wareView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LGWareView *ware = [[LGWareView alloc] init];
    ware.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:ware];
    
    ware.precentText = @"68";
    ware.textInfo = @"用量";
    
    self.wareView = ware;
}

- (IBAction)start:(id)sender {
    [_wareView start];
}

- (IBAction)stop:(id)sender {
    [_wareView stop];
}
@end
