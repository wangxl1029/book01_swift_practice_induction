//
//  ViewController.swift
//  TabbedApp2
//
//  Created by alan king on 2019/1/9.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {
    
    // 添加Tab Bar控件
    var tabBar: UITabBar!

    // Tab Bar Item的名称数组
    var tabs = ["公开课", "全栈课", "设置"]
    
    // Tab Bar上方的容器
    var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 底部创建Tab Bar
        tabBar = UITabBar(frame: CGRect(x: 0, y: self.view.bounds.height - 64, width: self.view.bounds.width, height: 44))
        
        // 创建多个Item项
        var items: [UITabBarItem] = []
        for tab in self.tabs {
            let tabItem = UITabBarItem()
            tabItem.title = tab
            items.append(tabItem)
        }
        
        // 设置Tab Bar的标签页
        tabBar.setItems(items, animated: true)
        // 本类实现UITabBarDelegate代理，切换标签页时能响应事件
        tabBar.delegate = self
        // 代码添加到界面上来
        self.view.addSubview(tabBar)
        
        // 上方容器
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 44))
        self.view.addSubview(contentView)
        let lbl = UILabel(frame: CGRect(x: 100, y: 200, width: 100, height: 20))
        // 定义tag，在用户切换tab时能查询到label控件
        lbl.tag = 1
        contentView.addSubview(lbl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    // UITabBarDelegate协议的方法，在用户选择不同的标签页时调用
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // 通过Tag查询到上方容器的label，并设置为当前选择的标签页的名称
        (contentView.viewWithTag(1) as! UILabel).text = item.title
    }
}

