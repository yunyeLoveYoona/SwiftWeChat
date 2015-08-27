//
//  Message.swift
//  WeChat_Yun
//
//  Created by 叶云 on 15/7/28.
//  Copyright (c) 2015年 叶云. All rights reserved.
//

import UIKit

class WeChatMessageModel: NSObject{
    var image : String
    var title : String
    var msg : String
    var time : NSData
    var id : String
    init(id:String,image:String,title:String,msg:String,time:NSData){
        self.image = image
        self.title = title
        self.time = time
        self.msg = msg
        self.id = id
    }
}
