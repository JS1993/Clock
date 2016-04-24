//
//  ViewController.m
//  Colock
//
//  Created by  江苏 on 16/4/24.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

#define viewW self.clock.bounds.size.width*0.5
#define viewH self.clock.bounds.size.height*0.5


@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *clock;
@property(strong,nonatomic)CALayer* secondLayer;
@property(strong,nonatomic)CALayer* minLayer;
@property(strong,nonatomic)CALayer* hourLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHourPointer];
    
    [self setUpMinPointer];
    
    [self setUpSecondPointer];
    
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

-(void)timeChange{
    //获得当前日历对象
    NSCalendar* calendar=[NSCalendar currentCalendar];
    //获得此时的日期组件
    NSDateComponents* com=[calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:[NSDate date]];
    
    NSInteger second=com.second;
    
    NSInteger min=com.minute;
    
    NSInteger hour=com.hour;
    
    CGFloat secondA=second*6*M_PI/180.0;
    
    CGFloat minA=min*6*M_PI/180.0;
    
    CGFloat hourA=(hour*30+min*0.5)*M_PI/180.0;
    
    //设置旋转角度
    self.secondLayer.transform=CATransform3DMakeRotation(secondA, 0, 0, 1);
    self.minLayer.transform=CATransform3DMakeRotation(minA, 0, 0, 1);
    self.hourLayer.transform=CATransform3DMakeRotation(hourA, 0, 0, 1);
    
    
    
}

#pragma mark--设置秒钟
-(void)setUpSecondPointer{
    
    //新建layer层
    CALayer *layer=[CALayer layer];
    
    //设置锚点
    layer.anchorPoint=CGPointMake(0.5, 1);
    
    layer.backgroundColor=[UIColor redColor].CGColor;
    
    //设置位置
    layer.position=CGPointMake(viewW,viewH);
    
    layer.bounds=CGRectMake(0, 0, 1, self.clock.bounds.size.width*0.5-20);
    
    [self.clock.layer addSublayer:layer];
    
    self.secondLayer=layer;
    
    
}

#pragma mark--设置分钟
-(void)setUpMinPointer{
    
    CALayer *layer=[CALayer layer];
    
    layer.anchorPoint=CGPointMake(0.5, 1);
    
    layer.backgroundColor=[UIColor blackColor].CGColor;
    
    layer.position=CGPointMake(viewW,viewH);
    
    layer.bounds=CGRectMake(0, 0, 4, self.clock.bounds.size.width*0.5-20);
    
    layer.cornerRadius=4;
    
    [self.clock.layer addSublayer:layer];
    
    self.minLayer=layer;
    
}

#pragma mark--设置分钟
-(void)setUpHourPointer{
    
    CALayer *layer=[CALayer layer];
    
    layer.anchorPoint=CGPointMake(0.5, 1);
    
    layer.backgroundColor=[UIColor blackColor].CGColor;
    
    layer.position=CGPointMake(viewW,viewH);
    
    layer.bounds=CGRectMake(0, 0, 4, self.clock.bounds.size.width*0.5-40);
    
    layer.cornerRadius=4;
    
    [self.clock.layer addSublayer:layer];
    
    self.hourLayer=layer;
    
}


@end
