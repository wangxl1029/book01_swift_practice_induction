//
//  ThirdViewController.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/15.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ctrlnames: [String]?
    var tableView: UITableView?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 初始化数据，这一次数据，我们主在属性值列表文件里
        self.ctrlnames = NSArray(contentsOfFile: Bundle.main.path(forResource: "Controls", ofType: "plist")!) as? Array
        print(self.ctrlnames!)
        
        // 创建表视图
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        // 创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        // 创建表头标签
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        headerLabel.backgroundColor = UIColor.black
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.text = "常见UIKit控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView!.tableHeaderView = headerLabel
    }

    // 返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames!.count
    }
    
    // 创建各单元格的显示内容（创建参数indexPath指定单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 为了提供表格显示性能，已创建完成的单元需要重复使用
        let identify: String = "SwiftCell"
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.text = self.ctrlnames![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let itemString = self.ctrlnames![indexPath.row]
        let alertview = UIAlertView()
        alertview.title = "提示！"
        alertview.message = "你选中了【\(itemString)】"
        alertview.addButton(withTitle: "确定")
        alertview.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
