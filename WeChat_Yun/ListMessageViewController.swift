//
//  ListMessageViewController.swift
//  WeChat_Yun
//
//  Created by 叶云 on 15/7/30.
//  Copyright (c) 2015年 叶云. All rights reserved.
//
//

import UIKit
class ListMessageViewController : UIViewController,UITableViewDataSource{
    var message : MessageModel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), forBarMetrics : UIBarMetrics.Default)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var attributes = NSMutableDictionary()
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController?.navigationBar.titleTextAttributes = attributes as [NSObject : AnyObject]
        var titleView : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: (message.title as NSString).length * 20, height: 44))
        titleView.textColor = UIColor.whiteColor()
        titleView.text = message.title
        self.navigationItem.titleView = titleView
        tableView.dataSource = self
        self.tabBarController?.tabBar.hidden = true
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell") as! UITableViewCell
        var msg : MessageModel!
        msg = message.messages![indexPath.row]
        var imageView :UIImageView = UIImageView(frame: CGRectMake(14, 5, 60, 60))
        imageView.image = UIImage(named: msg.image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        var title : UILabel! = cell.viewWithTag(101) as! UILabel
        title.text = msg.addrees
        var msgLabel : UILabel! = cell.viewWithTag(103) as! UILabel
        msgLabel.text = msg.msg
        var time : UILabel! = cell.viewWithTag(102) as! UILabel
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("HH:mm", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        time.text = dateFormatter.stringFromDate(msg.time!)
        
        cell.addSubview(imageView)
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.messages == nil ? 0: message.messages!.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            message.messages!.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var leftBar = UIBarButtonItem(title: message.title, style: UIBarButtonItemStyle.Plain, target: self,action: "close:")
        self.navigationItem.backBarButtonItem = leftBar
        if segue.identifier == "messageDetailed"{
            var viewController = segue.destinationViewController as! MessageDetailedController
            viewController.message = message.messages![tableView.indexPathForSelectedRow()!.row]
            
        }
        
    }
    func close(segue : UIStoryboardSegue){
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.popViewControllerAnimated(true)
    }
       


}
