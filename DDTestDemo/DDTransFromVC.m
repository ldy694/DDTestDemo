//
//  DDTransFromVC.m
//  DDTestDemo
//
//  Created by 林兴栋 on 16/7/21.
//  Copyright © 2016年 林兴栋. All rights reserved.
//

#import "DDTransFromVC.h"

typedef enum : NSUInteger {
    MyEnumValueA        =1<<2,
    MyEnumValueB,
    MyEnumValueC,
} MyEnum;

typedef NS_OPTIONS(NSUInteger,AAAAAA){
    a1,
    b2,
    c3,
}BBBB;

typedef NS_OPTIONS(NSUInteger, DDName) {
    Libing      =1<<2,
    Yang,
    LaoLai
};

@interface DDTransFromVC ()
@property (weak, nonatomic) IBOutlet UIImageView *touchImage;
@property (weak, nonatomic) IBOutlet UIView *bigView;

@end
static CGPoint startPoint;
static CGFloat isUpDownTouch;
@implementation DDTransFromVC
- (IBAction)BackPage:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MyEnum state = MyEnumValueA;
    AAAAAA a = a1;
    DDName name = LaoLai;
    NSLog(@"%ld+%ld",name,LaoLai);
    NSMutableString * temString = [NSMutableString stringWithFormat:@"\n"];
    for (int i = 0; i<9; i++) {for (int k = 0; k<9; k++) {
            if (k == 8) {
                [temString appendString:@"*\n"];
            }else{
                if (i == 0 || i == 8) {
                    [temString appendString:@"*"];
                }else{
                    if (k==0) {
                        [temString appendString:@"*"];
                    }else{
                        [temString appendString:@"o"];
                    }
                }
            }
        }
    }
    NSLog(@"%@",temString);
    switch (state) {
        case MyEnumValueA:{
            NSString * tem = @"ddd";
            NSLog(@"%@",tem);
        }break;
        case MyEnumValueB:
            
            break;
        case MyEnumValueC:
            
            break;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    startPoint = [[touches anyObject] locationInView:self.bigView];
    CGPoint point = [[touches anyObject] locationInView:self.view];
    isUpDownTouch = point.y - self.view.bounds.size.height/2.0;
//    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/testDB.sqlit"];
    FMDatabaseQueue * fm = [FMDatabaseQueue databaseQueueWithPath:path];
    [fm inDatabase:^(FMDatabase *db) {
        BOOL isOK = [db executeUpdate:@"create table dongdongone (id integer primary key autoincrement, lin text, xing text, dong text);"];
        if (!isOK) {
            NSLog(@"error = %@",[db lastErrorMessage]);
        }
        isOK = [db executeUpdate:@"insert into dongdongone (lin,xing,dong) values ('林','兴','栋');"];
        isOK = [db executeUpdate:@"insert into dongdongone (lin,xing,dong) values ('赖','燕','伟');"];

        if (!isOK) {
            NSLog(@"error = %@",[db lastErrorMessage]);
        }
        FMResultSet * resouce = [db executeQuery:@"select * from dongdongone;"];
        NSMutableArray * nowArr = [NSMutableArray new];
        while ([resouce next]) {
            NSMutableDictionary * dic = [NSMutableDictionary new];
            [dic setObject:[resouce stringForColumn:@"lin"] forKey:@"lin"];
            [dic setObject:[resouce stringForColumn:@"xing"] forKey:@"xing"];
            [dic setObject:[resouce stringForColumn:@"dong"] forKey:@"dong"];
            [nowArr addObject:dic];
//            NSString * temStr = [resouce stringForColumn:@"lin"];
//            NSLog(@"%@",temStr);
        }
        NSLog(@"%@",nowArr);
    }];
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGAffineTransform oldTranform = CGAffineTransformMakeScale(1, 1);
    CGAffineTransform nowTranform = CGAffineTransformRotate(oldTranform, 0*M_PI_2/180);
    self.touchImage.transform = nowTranform;
    self.bigView.center = self.view.center;
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    @autoreleasepool {
        UITouch * tou = [touches anyObject];
        if (tou.view != self.bigView) {
            return;
        }
        CGPoint nowPoint = [tou locationInView:self.bigView];
        CGPoint oldPoint = startPoint;//[tou precisePreviousLocationInView:self.bigView];
        CGPoint cent = self.bigView.center;
        cent = CGPointMake(cent.x+(nowPoint.x-oldPoint.x), cent.y+(nowPoint.y-oldPoint.y));
        self.bigView.center = cent;
        CGAffineTransform oldTranform = CGAffineTransformMakeScale(1, 1);
        CGFloat h = (self.view.bounds.size.width/2.0-cent.x)/4.0;
        if (isUpDownTouch < 0) {
            h = -h;
        }
        CGAffineTransform nowTranform = CGAffineTransformRotate(oldTranform, h*M_PI_2/180);
        self.touchImage.transform = nowTranform;
        startPoint = oldPoint;
    }
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
