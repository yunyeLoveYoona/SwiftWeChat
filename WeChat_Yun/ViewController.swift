//
//  ViewController.swift
//  WeChat_Yun
//
//  Created by 叶云 on 15/7/24.
//  Copyright (c) 2015年 叶云. All rights reserved.
//

import UIKit

var messages : [MessageModel] = []
var search_messages : [MessageModel] = []
class ViewController: UIViewController,UITableViewDataSource,UITabBarDelegate,UISearchDisplayDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), forBarMetrics : UIBarMetrics.Default)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        var attributes = NSMutableDictionary()
        attributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        navigationController?.navigationBar.titleTextAttributes = attributes as [NSObject : AnyObject]
        tabBarItem.image = nil
        var image = UIImage(named: "alq")
        var selectIamge = UIImage(named: "alp")
        image = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        selectIamge = selectIamge?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabBarItem = UITabBarItem(title: "微信", image: image, selectedImage: selectIamge)
        var tabBaritem_attributes = NSMutableDictionary()
        tabBaritem_attributes.setValue(UIColor.greenColor(), forKey: NSForegroundColorAttributeName)
        tabBarItem.setTitleTextAttributes(tabBaritem_attributes as [NSObject : AnyObject], forState: UIControlState.Selected)
        tableView.dataSource = self
    
        searchBar.placeholder = "搜索"
        var message1 : MessageModel = MessageModel(id: "1",image:"default_bottle",title:"我的瓶子",time: nil,msg:"",addrees : "")
        message1.messages?.append(MessageModel(id: "1",image:"default_bottle",title:"",time: dateFromString("20:35")!,msg:"帅哥约吗",addrees : "浙江杭州"))
        messages.append(message1)
        
        var message2 : MessageModel = MessageModel(id: "2",image:"default_brand_contact",title:"订阅号",time: nil,msg:"",addrees : "")
        message2.messages?.append(MessageModel(id: "2",image:"default_brand_contact",title:"",time: dateFromString("20:35")!,msg:"抽红包",addrees : "中央电视台"))
        messages.append(message2)

        var message3 : MessageModel = MessageModel(id: "3",image:"default_servicebrand_contact",title:"公众号",time: nil,msg:"",addrees : "")
        message3.messages?.append(MessageModel(id: "3",image:"default_servicebrand_contact",title:"",time: dateFromString("20:35")!,msg:"中国古代印章展",addrees : "西泠印社"))
        messages.append(message3)
        
        var contentOffset = tableView.contentOffset
        contentOffset.y += searchBar.frame.size.height
        contentOffset.y += searchBar.frame.size.height
        tableView.contentOffset = contentOffset
        self.tabBarController?.tabBar.hidden = false
    }
    func dateFromString(dateStr : String) -> NSDate!{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.dateFromString(dateStr)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell") as! UITableViewCell
        var message : MessageModel!
        if tableView == self.searchDisplayController?.searchResultsTableView{
             message = search_messages[indexPath.row]
        }else{
             message = messages[indexPath.row]
        }
        var imageView :UIImageView = UIImageView(frame: CGRectMake(14, 5, 60, 60))
        imageView.image = UIImage(named: message.image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        var title : UILabel! = cell.viewWithTag(101) as! UILabel
        title.text = message.title
        var msg : UILabel! = cell.viewWithTag(103) as! UILabel
        msg.text = message.messages![0].addrees + "：" + message.messages![0].msg
        var time : UILabel! = cell.viewWithTag(102) as! UILabel
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("HH:mm", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        time.text = dateFormatter.stringFromDate(message.messages![0].time!)
        cell.addSubview(imageView)
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchDisplayController?.searchResultsTableView{
            return search_messages.count
        }
        return messages.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            messages.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool{
        search_messages = messages.filter(){$0.title.rangeOfString(searchString) != nil}
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var leftBar = UIBarButtonItem(title: "微信", style: UIBarButtonItemStyle.Plain, target: self,action: "close:")
        self.navigationItem.backBarButtonItem = leftBar
        if segue.identifier == "listMessage"{
            var viewController = segue.destinationViewController as! ListMessageViewController
            if tableView.indexPathForSelectedRow() == nil{
                viewController.message = search_messages[searchDisplayController!.searchResultsTableView!.indexPathForSelectedRow()!.row]
            }else{
                viewController.message = messages[tableView.indexPathForSelectedRow()!.row]
            }
            
        }
        
    }
    
    @IBAction func close(segue : UIStoryboardSegue){
        self.tabBarController?.tabBar.hidden = false
    }
    override func viewWillAppear(animated: Bool) {
         self.tabBarController?.tabBar.hidden = false
    }


}

