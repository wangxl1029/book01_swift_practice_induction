//
//  ViewController.swift
//  NaviRootViewApp
//
//  Created by alan king on 2019/1/12.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 表格加载
    var tableView: UITableView?
    
    // 控件类型
    let ctrls = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UITextView", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Swift控件演示"
        //
        self.tableView = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    // UITableViewDataSource 协议方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrls.count
    }
    
    // UITableViewDataSource 协议方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.text = self.ctrls[indexPath.row]
        
        return cell
    }
}

