//
//  DetailViewController.swift
//  NaviRootViewApp
//
//  Created by alan king on 2019/1/12.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 设置背景颜色
        self.view.backgroundColor = UIColor.white
        // 按title加载控件
        loadControl(ctrl: self.title!)
        
        // 设置代码和控件展示切换按钮，增加到导航条右侧
        // 这里采用了navigationController不能增加navigationItem
        let btn = UIBarButtonItem(title: "代码", style: .plain, target: self, action: #selector(DetailViewController.btnCodeClicked(sender:)))
        self.navigationItem.rightBarButtonItem = btn
    }
    
    // 显示控件代码
    func loadControl(ctrl: String) {
        switch ctrl {
        case "UILabel":
            let label = UILabel(frame: self.view.bounds)
            label.backgroundColor = UIColor.clear
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 36)
            label.text = "Hello, Ucai"
            self.view.addSubview(label)
        default:
            print("control name: \(ctrl)")
        }
    }

    // 清空所有子视图
    func clearViews() {
        for v in self.view.subviews as [UIView] {
            v.removeFromSuperview()
        }
    }
    
    // 显示按钮控件
    @objc
    func btnCodeClicked(sender: AnyObject) {
        print("title: \(self.title!)")
        clearViews()
        
        if self.navigationItem.rightBarButtonItem!.title! == "代码" {
            self.navigationItem.rightBarButtonItem!.title = "效果"
        }else{
            self.navigationItem.rightBarButtonItem!.title = "代码"
            loadControl(ctrl: self.title!)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
