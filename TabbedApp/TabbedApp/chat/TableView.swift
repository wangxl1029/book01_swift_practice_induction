//
//  TableView.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/19.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    // 用于保存所有消息
    var bubbleSection: Array<NSMutableArray>
    // 数据源，用于与ViewController交换数据
    var chatDataSource: ChatDataSource!
    
    init(frame: CGRect) {
        self.bubbleSection = Array<NSMutableArray>()
        super.init(frame: frame, style: .grouped)
        self.backgroundColor = UIColor.clear
        self.separatorStyle = .none
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) { // Allen : Swift IDE required
        fatalError("init(coder:) has not been implemented")
    }
    
    func sortData(m1: MessageItem, m2: MessageItem) -> Bool {
        return m1.date.timeIntervalSince1970 < m2.date.timeIntervalSince1970
    }
    
    // 按日期排序方法
    override func reloadData() {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        var count = 0
        if self.chatDataSource != nil {
            count = self.chatDataSource.rowsForChatTable(tableView: self)
            
            if count > 0 {
                var bubbleData = Array<MessageItem>()
                for i in 0..<count {
                    let object = self.chatDataSource.chatTableView(tableView: self, dataForRow: i)
                    bubbleData.append(object)
                }
                bubbleData.sort{
                    if let a = $0.date, let b = $1.date {
                        return a.timeIntervalSince1970 < b.timeIntervalSince1970
                    }
                    
                    return false;
                }
                var last = ""
                var currentSection = NSMutableArray()
                // 创建一个日期格式器
                let dformatter = DateFormatter()
                // 为日期格式器设置格式字符串
                dformatter.dateFormat = "dd"
                
                for i in 0 ..< count {
                    let data = bubbleData[i]
                    // 使用日期格式器格式化日期，日期不同，就重新分组
                    let datestr = dformatter.string(from: data.date! as Date)
                    if datestr != last {
                        currentSection = NSMutableArray()
                        self.bubbleSection.append(currentSection)
                    }
                    
                    self.bubbleSection[self.bubbleSection.count - 1].add(data)
                    last = datestr
                }
            }
        }
        super.reloadData()
        
        // 滑向最后一部分
        let secno = self.bubbleSection.count - 1
        let indexPath = IndexPath(row: self.bubbleSection[secno].count, section: secno)
        
        self.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    // 第一个方法返回分区数，在本例中，就是1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 返回指定分区的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section >= self.bubbleSection.count {
            return 1
        }
        
        return self.bubbleSection[section].count + 1
    }
    
    // 用于确定单元格的高度，如果此方法实现得不对，单元格与单元格之间会错位
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Header
        if indexPath.row == 0 {
            return TableHeaderViewCell.getHeight()
        }
        
        let section = self.bubbleSection[indexPath.section]
        let data = section[indexPath.row - 1]
        
        let item = data as! MessageItem
        
        return max(item.insets.top + item.view.frame.height + item.insets.bottom, 52)
    }
    
    // 返回自定义的TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Header based on snapInterval
        if indexPath.row == 0 {
            let cellId = "HeaderCell"
            let hcell = TableHeaderViewCell(reuseIdentifier: cellId)
            let section = self.bubbleSection[indexPath.section]
            let data = section[indexPath.row] as! MessageItem
            
            hcell.setData(value: data.date as Date)
            return hcell
        }
        
        // standard
        let cellId = "MsgCell"
        let section = self.bubbleSection[indexPath.section]
        let data = section[indexPath.row - 1]
        let cell = TableViewCell(data: data as! MessageItem, reuseIdentifier: cellId)
        return cell
     }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
