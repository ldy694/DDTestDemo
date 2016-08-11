//
//  DDTestVC.swift
//  DDTestDemo
//
//  Created by 林兴栋 on 16/7/22.
//  Copyright © 2016年 林兴栋. All rights reserved.
//

import UIKit
struct Frame {
    //结构体中有两个属性类型
    
    
    //存储属性: 仅仅做存储值得作用
    var x : Float
    var y : Float
    var width : Float
    var height : Float
    
    
    //计算属性 : 通过计算获取的值
    //计算属性类似OC中的属性
    //需要设置属性的set和get方法
    //属性里面的set方法不能单独存在,必须有一个同属性的get方法存在之后才可以写set
    var centerX : Float {
        get{
            return x + width / 2
        }
        set{
            self.centerX = newValue
        }
    }
    
    var centerY : Float {
        get{
            return y + height / 2
        }
        set{
            self.centerY = newValue
        }
    }
    
    
    //在Swift的结构体里面,可以创建一个init方法  (x是外部参数名,用来在外部显示,外部参数名不能再方法中使用,newX是内部参数名,用来在方法内部使用)
    init(x newX : Float , y newY : Float , width newWidth : Float ,height newHeight : Float){
        self.x = newX
        self.y = newY
        self.width = newWidth
        self.height = newHeight
    }
    
    //Swift在结构体中可以任意的创建参数
    //如果需要函数里面修改属性的值,需要在函数前面添加mutating关键词修饰
    mutating func modify () {
        self.x = 100
        print(self.x)
    }
    
    
    
    //结构体属性 : static 修饰的变量
    //结构体属性不能再普通的函数中调用
    static var name : String? = nil
    
    
    
    //结构体函数 : static 修饰的函数
    //结构体函数可以调用 结构体方法   也可以调用结构体属性
    //结构体函数不能调用普通的属性
    static func structFunc(){
        self.name = "海贼王"
        print(self.name)
    }
}


//结构体函数 结构体属性 只能使用结构体直接调用  不能使用结构体变量调用

//第一种调用结构体init(初始化)
//var frame : Frame = Frame(x: 10, y: 10, width: 100, height: 100)
//
//frame.modify()
//
////第二种
//var frame1 : Frame = Frame.init(x: 10, y: 10, width: 20, height: 20)
//
//Frame.structFunc()
protocol SomeProtocol {
    var linDong:String{set get}
    
}

class SomeSuperClass:SomeProtocol {
    var linDong: String{
        get{
            return "李冰";
        }
        set{
            self.linDong = "老赖";
        }
    }
    
    
    
    
}

class DDTestVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tem = SomeSuperClass();
        print("\(tem.linDong)");
        self.view.backgroundColor = UIColor.greenColor()
        self.mainTableView.mj_header = DDIYHeader.init(refreshingTarget: self, refreshingAction: #selector(cloceMJ))
        self.mainTableView.mj_footer = DDIYFooter.init(refreshingTarget: self, refreshingAction: #selector(cloceMJ))
//        let arr:[AnyObject] = [UIImage.init(named: "Comp 4 00000")!,UIImage.init(named: "Comp 4 00010")!];
//        let MJf:MJRefreshBackGifFooter = MJRefreshBackGifFooter.init(refreshingTarget: self, refreshingAction: #selector(cloceMJ));
//        MJf.setImages(arr, forState: MJRefreshState.Idle)
//        MJf.setImages(arr, forState: MJRefreshState.Pulling)
//        MJf.setImages(arr, forState: MJRefreshState.Refreshing)
//        MJf.setImages(arr, forState: MJRefreshState.WillRefresh)
//        self.mainTableView.mj_footer = MJf;
    }
    func cloceMJ() -> Void {
        self.mainTableView.mj_header.endRefreshing();
        self.mainTableView.mj_footer.endRefreshing();
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("default");
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "default") ;
            cell?.backgroundColor = UIColor.redColor();
        }
        return cell!;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
