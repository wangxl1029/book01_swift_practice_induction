//
//  File.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/22.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import Foundation

/*
 用户信息类
 */
class UserInfo:NSObject
{
    var username:String = ""
    var avatar:String = ""
    
    init(name:String, logo:String)
    {
        self.username = name
        self.avatar = logo
    }
}
