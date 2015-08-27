//
//  TxlViewController.swift
//  WeChat_Yun
//
//  Created by 叶云 on 15/7/24.
//  Copyright (c) 2015年 叶云. All rights reserved.
//
//

import UIKit
class TxlViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), forBarMetrics : UIBarMetrics.Default)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var attributes = NSMutableDictionary()
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController?.navigationBar.titleTextAttributes = attributes as [NSObject : AnyObject]
        var image = UIImage(named: "alm")
        var selectIamge = UIImage(named: "all")
        image = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        selectIamge = selectIamge?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabBarItem = UITabBarItem(title: "通讯录", image: image, selectedImage: selectIamge)
        var tabBaritem_attributes = NSMutableDictionary()
        tabBaritem_attributes.setValue(UIColor.greenColor(), forKey: NSForegroundColorAttributeName)
        tabBarItem.setTitleTextAttributes(tabBaritem_attributes as [NSObject : AnyObject], forState: UIControlState.Selected)
        


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
