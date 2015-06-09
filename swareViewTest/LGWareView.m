//
//  LGWareView.m
//  swareViewTest
//
//  Created by jamy on 15/6/9.
//  Copyright (c) 2015年 jamy. All rights reserved.
//

#import "LGWareView.h"
#import "LGProcessWareView.h"

@interface LGWareView ()
@property (nonatomic, weak) LGProcessWareView *processView;
@property (nonatomic, weak) UIImageView *backGroundView;
@property (nonatomic, weak) UILabel *precentLabel;
@property (nonatomic, weak) UILabel *textLabel;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LGWareView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}


- (void)setup
{
    UIImageView *bgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fb_rotation"]];
    [self addSubview:bgroundImage];
    self.backGroundView = bgroundImage;
    
    LGProcessWareView *processView = [[LGProcessWareView alloc] init];
    [self addSubview:processView];
    _processView = processView;
    
    UILabel *preLabel = [[UILabel alloc] init];
    preLabel.textAlignment = NSTextAlignmentCenter;
    preLabel.font = [UIFont boldSystemFontOfSize:60];
    preLabel.textColor = [UIColor whiteColor];
    [self addSubview:preLabel];
    _precentLabel = preLabel;
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont systemFontOfSize:20];
    textLabel.textColor = [UIColor whiteColor];
    [self addSubview:textLabel];
    _textLabel = textLabel;
}

-(void)setPrecentText:(NSString *)precentText
{
    _precentText = precentText;
  //  self.precentLabel.text = precentText;
    
    if(_processView)
        _processView.precent = [precentText floatValue];
}

-(void)setTextInfo:(NSString *)textInfo
{
    _textInfo = textInfo;
    self.textLabel.text = textInfo;
}

-(void)start
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.06 target:self selector:@selector(beginLink) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
    
    [_processView start];
}

- (void)beginLink
{
    int value = [self.precentLabel.text intValue];
    
    if (value < [self.precentText intValue]) {
        value ++;
        self.precentLabel.text = [NSString stringWithFormat:@"%d", value];
    }
    else
    {
        [self stopTimer];
    }
}

- (void)stopTimer
{
    if(self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)stop
{
    self.precentLabel.text = nil;
    if(self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    [_processView stop];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewH = self.frame.size.height;
    CGFloat viewW = self.frame.size.width;
    
    _processView.frame = CGRectMake(10, 10, viewW-20, viewH-20);
    _processView.layer.cornerRadius = MIN(_processView.frame.size.width / 2, _processView.frame.size.height / 2);
    _processView.layer.masksToBounds = YES;
    
    CGFloat precentH = _precentLabel.font.pointSize+10;
    CGFloat textH = _textLabel.font.pointSize;
    
    _backGroundView.frame= self.bounds;
    
    _precentLabel.frame = CGRectMake(0 , (viewH - precentH - textH)/2, viewW, precentH);
    _textLabel.frame = CGRectMake(0, _precentLabel.frame.origin.y + precentH, viewW, textH);
}



@end
