//
//  MessageDetailedController.swift
//  WeChat_Yun
//
//  Created by 叶云 on 15/8/3.
//  Copyright (c) 2015年 叶云. All rights reserved.
//
//

import UIKit
class MessageDetailedController : UIViewController{
    var message : MessageModel!
   
    @IBOutlet weak var time: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), forBarMetrics : UIBarMetrics.Default)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var attributes = NSMutableDictionary()
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController?.navigationBar.titleTextAttributes = attributes as [NSObject : AnyObject]
        var titleStr = "来自" + message.addrees + "的瓶子"
        var titleView : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: (titleStr as NSString).length * 20, height: 44))
        titleView.textColor = UIColor.whiteColor()
        titleView.text = titleStr
        self.navigationItem.titleView = titleView
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("HH:mm", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        time.text = dateFormatter.stringFromDate(message.time!)
        var userImage : UIImageView = UIImageView(frame: CGRect(x: 10, y: 150, width: 50, height: 50))
        userImage.image = UIImage(named: message.image)
        self.view.addSubview(userImage)
        var msg_back : UIImageView = UIImageView(frame: CGRect(x: 70, y: 150, width: (message.msg as NSString).length * 25, height: 50))
        msg_back.image = UIImage(named: "abx.9")
        self.view.addSubview(msg_back)

        var msg : UILabel = UILabel(frame: CGRect(x: 70, y: 150, width: (message.msg as NSString).length * 25, height: 50))
        msg.textColor = UIColor.blackColor()
        msg.textAlignment = NSTextAlignment.Center
        var attributes_msg = NSMutableDictionary()
        msg.font.fontWithSize(20)
        msg.text = message.msg
        self.view.addSubview(msg)
        
    }
    func close(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
