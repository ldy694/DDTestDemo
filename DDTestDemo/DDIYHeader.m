//
//  DDIYHeader.m
//  
//
//  Created by 林兴栋 on 16/8/5.
//
//

#import "DDIYHeader.h"

@interface DDIYHeader()
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIImageView *logo;

@end

@implementation DDIYHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 100;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
    // logo
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        if (i<10) {
            NSString * imgStr = [NSString stringWithFormat:@"Comp 4 0000%d",i];
            if ([UIImage imageNamed:imgStr]) {
                [arr addObject:[UIImage imageNamed:imgStr]];
            }
        }else{
            NSString * imgStr = [NSString stringWithFormat:@"Comp 4 000%d",i];
            if ([UIImage imageNamed:imgStr]) {
                [arr addObject:[UIImage imageNamed:imgStr]];
            }
        }
    }
    logo.animationImages = arr;
    logo.animationDuration = 1;
    [logo startAnimating];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = CGRectMake(0, 80, self.mj_w, 20);
    
    self.logo.bounds = CGRectMake(0, 0, 80, 80);
    self.logo.center = CGPointMake(self.mj_w * 0.5, 40);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = @"赶紧下拉吖(开关是打酱油滴)";
            [self.logo startAnimating];
            break;
        case MJRefreshStatePulling:
            self.label.text = @"赶紧放开我吧(开关是打酱油滴)";
            [self.logo startAnimating];
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"加载数据中(开关是打酱油滴)";
            [self.logo startAnimating];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
}


@end
