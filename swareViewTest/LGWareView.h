//
//  LGWareView.h
//  swareViewTest
//
//  Created by jamy on 15/6/9.
//  Copyright (c) 2015年 jamy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGWareView : UIView

@property (nonatomic, copy) NSString *precentText;
@property (nonatomic, copy) NSString *textInfo;

- (void)start;

- (void)stop;

@end
