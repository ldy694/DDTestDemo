//
//  ViewController.m
//  DDTestDemo
//
//  Created by 林兴栋 on 16/6/29.
//  Copyright © 2016年 林兴栋. All rights reserved.
//

#import "ViewController.h"
//@class SecondViewController;
#import "SecondViewController.h"

NSString * const kViewControllerConstTest = @"测试内容";
NSString * const kViewControllerConstTestTwo = @"不知道";
const NSInteger kViewControllerConstNum = 2;

static NSString * kViewControllerConstTestStatic = @"测测";
#import <AFNetworking/AFNetworking.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testim;

@end

@implementation ViewController

- (IBAction)regularBtn:(id)sender {
    [self testGoAF];
}
- (IBAction)notRegularBtn:(id)sender {
    [self testAF];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    kViewControllerConstTestStatic = [kViewControllerConstTestStatic stringByAppendingString:@"aaaaa"];
    NSLog(@"%@",kViewControllerConstTestStatic);
}
- (void)testGoAF{
    AFHTTPSessionManager * manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://ip.taobao.com"]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    [manager GET:@"/service/getIpInfo.php?ip=180.167.5.90" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        NSLog(@"%@",error);
    }];
}
- (void)testAF{
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:@"http://www.86sb.com/Api/News/News.aspx?newsid=71" parameters:nil error:nil];
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
           
        } else {
            NSData * tem = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
            NSString *jsonString = [[NSString alloc] initWithData:tem encoding:NSUTF8StringEncoding];
            NSLog(@"%@",jsonString);
/*
 
 @"{\"result\":\"1\",
\"msg\":\"\",\"data\":[{\"newsid\":\"71\",\"newstitle\":\"理论与方法:商誉、商标权、专利权评估的特点\",\"newssource\":\"www.86sb.com\",\"newsdate\":\"2014-9-20 14:25:09\",\"newsbody\":\"&lt;div&gt;&amp;nbsp; &amp;nbsp;商誉、商标权、专利权评估的特点如下：&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; &lt;strong&gt;1、商誉评估的特点&lt;/strong&gt;&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （1）商誉不能离开企业而单独存在，不能与企业可确指的资产分开出售。&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （2）商誉是多项因素作用形成的结果，但形成商誉的个别因素，不能以任何方法单独计价。&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （3）商誉本身不是一项单独的、能产生效益的无形资产，而只是超过企业可确指的各单项资产价值之和的价值。&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （4）商誉是企业长期积累起来的一项价值。&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; &lt;strong&gt;2、商标权评估的特点&lt;/strong&gt;&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （1）排他专用性&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （2）转让性&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （3）许可使用性&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; （4）继承性&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp; &amp;nbsp; &lt;strong&gt;3、专利权评估的特点&lt;/strong&gt;&lt;/div&gt;\r\n&"
 
 */
        }
    }] resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
