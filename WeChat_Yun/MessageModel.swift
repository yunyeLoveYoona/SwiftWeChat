//
//  TodoModel.swift
//  Todo
//
//  Created by 叶云 on 15/7/7.
//  Copyright (c) 2015年 叶云. All rights reserved.
//

import UIKit

class MessageModel: NSObject {
    var id : String
    var image : String
    var title : String
    var time : NSDate?
    var addrees : String
    var msg : String
    var messages : [MessageModel]?
    init(id:String,image:String,title:String,time:NSDate?,msg:String,addrees:String) {
        self.id = id;
        self.image = image;
        self.title = title;
        self.time = time;
        self.msg = msg
        self.addrees = addrees
        self.messages = []
    }
    
}
