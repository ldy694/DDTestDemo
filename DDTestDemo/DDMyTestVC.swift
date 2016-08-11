//
//  DDMyTestVC.swift
//  DDTestDemo
//
//  Created by 林兴栋 on 16/7/1.
//  Copyright © 2016年 林兴栋. All rights reserved.
//

import UIKit
import LocalAuthentication

class DDMyTestVC: UIViewController {
    

    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func ddOpenThimage(sender: UIButton) {
        if #available(iOS 8.0, *) {
            let authenticationContext = LAContext()
            var error:NSError?;
            let isTouchIdAvailable = authenticationContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error );
            if isTouchIdAvailable {
                authenticationContext.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason:"验证了", reply: { (success, err) in
                    if success{
                        print("验证通过了");
                        dispatch_async(dispatch_get_main_queue(), {
                            self.view.backgroundColor = UIColor.redColor();
                            self.tipLabel.text = "这部手机的主人是：\(UIDevice.currentDevice().name)\n系统名：\(UIDevice.currentDevice().systemName)\n系统版本：\(UIDevice.currentDevice().systemVersion)\n手机模型：\(UIDevice.currentDevice().model)\n本地叫法：\(UIDevice.currentDevice().localizedModel)\n其它信息:\(NSLocale.preferredLanguages())";
                        });
                        
                    }else{
                        print("验证失败\(err)");
                    }
                })
            }
        } else {
            // Fallback on earlier versions
        };
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
