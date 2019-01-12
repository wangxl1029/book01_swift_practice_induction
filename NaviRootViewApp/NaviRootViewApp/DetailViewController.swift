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
        self.view.backgroundColor = UIColor.black
        // 设置代码和控件展示切换按钮，增加到导航条右侧
        // 这里采用了navigationController不能增加navigationItem
        let btn = UIBarButtonItem(title: "代码", style: .plain, target: self, action: #selector(DetailViewController.btnCodeClicked(sender:)))
        self.navigationItem.rightBarButtonItem = btn
    }
    
    @objc
    func btnCodeClicked(sender: AnyObject) {
        print("title: \(self.title!)")
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
