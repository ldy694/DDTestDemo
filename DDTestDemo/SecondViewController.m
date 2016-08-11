//
//  SecondViewController.m
//  DDTestDemo
//
//  Created by 林兴栋 on 16/7/20.
//  Copyright © 2016年 林兴栋. All rights reserved.
//

enum SecondEnumState{
    SecondEnumStateDisconnected = 1,
    SecondEnumStateConnecting,
    SecondEnumStateConnected,
};
typedef enum SecondEnumState secondState;
typedef void(^blockNew)();

#import "SecondViewController.h"
#import "ViewController.h"
#import "DDTransFromVC.h"


@interface SecondViewController ()
@property(assign,nonatomic)secondState temState;
@property(assign,nonatomic)blockNew newBlock;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%@,%@",kViewControllerConstTest,kViewControllerConstTestTwo);
    self.temState = SecondEnumStateDisconnected;
    switch (_temState) {
        case SecondEnumStateDisconnected:
            NSLog(@"SecondEnumStateDisconnected");
            break;
        case SecondEnumStateConnecting:
            NSLog(@"SecondEnumStateConnecting");
            break;
        case SecondEnumStateConnected:
            NSLog(@"SecondEnumStateConnected");
            break;
        default:
            NSLog(@"都不对");
            break;
    }
}
- (IBAction)pushToTransFrom:(UIButton *)sender {
    DDTransFromVC * transVC = [[DDTransFromVC alloc] initWithNibName:@"DDTransFromVC" bundle:nil];
    [self presentViewController:transVC animated:true completion:nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    int a = 19;
    int b = 20;
    int c = 0;
    c = a%b==0?0+a/b:1+a/b;
    NSLog(@"==%d",a%b);
    NSLog(@"==%d",c);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
