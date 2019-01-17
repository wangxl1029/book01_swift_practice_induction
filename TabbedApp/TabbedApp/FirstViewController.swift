//
//  FirstViewController.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/10.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

enum UIControlType {
    case Basic
    case Advanced
}
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var ctrlnames: [String]?
    var allnames:  Dictionary<Int, [String]>?
    var adHeader:  [String]?
    var ctype: UIControlType!
    var adCellStyle = UITableViewCell.CellStyle.default
    
    let OVERHEAD_MARGIN:CGFloat = 100 - 44
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 初始化数据，这一次数据，我们放在属性列表文件里
        self.ctrlnames = NSArray(contentsOfFile: Bundle.main.path(forResource: "Controls", ofType: "plist")!) as? Array
        print(self.ctrlnames!)
        
        // 初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames = [0:[String](self.ctrlnames!), 1:[String]([
            "UIDatePicker 日期选择器",
            "UIWebView 网页选项器",
            "UIToolbar 工具条",
            "UITableView 表格视图"])]
        
        print(self.allnames!)
        
        self.adHeader = ["常见 UIKit 控件", "高级 UIKit 控件"]
    }
    
    @IBAction func plainClicked(sender: UIBarButtonItem)
    {
        self.ctype = UIControlType.Basic
        
        // 创建表视图
        self.tableView = UITableView(frame: CGRect(x: 0, y: self.OVERHEAD_MARGIN, width: self.view.frame.width, height: self.view.frame.height - self.OVERHEAD_MARGIN), style: .plain)
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
        headerLabel.text = "常见 UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView!.tableHeaderView = headerLabel
    }
    
    @IBAction func groupClicked(sender: UIBarButtonItem){
        switch sender.title! {
        case "value1":
            self.adCellStyle = .value1
        case "value2":
            self.adCellStyle = .value2
        default:
            self.adCellStyle = .subtitle
        }
        
        self.ctype = UIControlType.Advanced
        
        // 创建表视图
        self.tableView = UITableView(frame: CGRect(x: 0, y: self.OVERHEAD_MARGIN, width: self.view.frame.width, height: self.view.frame.height - self.OVERHEAD_MARGIN), style: .grouped)
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
        headerLabel.text = "高级 UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        self.tableView!.tableHeaderView = headerLabel
    }

    // 在本例中，只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.ctype == UIControlType.Basic ? 1 : 2;
    }
    
    // 返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
    
    // UITableViewDataSourcef 协议中的方法，该方法的返回值决定指定分区的头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = self.adHeader!;
        return header[section]
    }
    
    // UITableViewDataSource 协议中的方法，该方法的返回值决定指定分区的尾部
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let data = self.allnames?[section]
        return "有\(data!.count)个控件"
    }
    
    // 创建各单元显示内容（创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 为了提供表格显示性能，在声明时已注册
        let identify: String = "SwiftCell"
        // 同一单元格重复使用，在声明时已注册
        
        let secno = indexPath.section
        let data = self.allnames?[secno]
        if secno == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
            cell.accessoryType = .disclosureIndicator
            
            let image = UIImage(named: "heart")
            cell.imageView!.image = image
            cell.textLabel!.text = data![indexPath.row]
            
            return cell
        }else{
            let adcell = UITableViewCell(style: self.adCellStyle, reuseIdentifier: "SwiftCell")
            adcell.textLabel!.text = data![indexPath.row]
            print(adcell.textLabel!.text!)
            adcell.detailTextLabel?.text = "这是\(data![indexPath.row])的说明"

            return adcell
        }
    }
    
    func tableView_old(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 为了提供表格显示性能，在声明时已注册
        let identify: String = "SwiftCell"
        // 同一单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        let secno = indexPath.section
        let data = self.allnames?[secno]
        cell.textLabel!.text = data![indexPath.row]
        
        return cell
    }
    
    // UITableViewDelegate方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        
        let itemString = self.ctrlnames![indexPath.row]
        let alertview = UIAlertView();
        alertview.title = "提示！"
        alertview.message = "你选中了【\(itemString)】"
        alertview.addButton(withTitle: "确定")
        alertview.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources thatcan be recreated
    }
}

