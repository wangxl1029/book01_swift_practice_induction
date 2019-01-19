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
    var bubbleSection:Array<MessageItem>
    // 数据源，用于与ViewController交换数据
    var chatDataSource: ChatDataSource!
    
    init(frame: CGRect) {
        self.bubbleSection = Array<MessageItem>()
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
                for i in 0 ..< count {
                    let object = self.chatDataSource.chatTableView(tableView: self, dataForRow: i)
                    bubbleSection.append(object)
                }
            }
        }
        super.reloadData()
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
        
        return self.bubbleSection.count + 1
    }
    
    // 用于确定单元格的高度，如果此方法实现得不对，单元格与单元格之间会错位
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Header
        if indexPath.row == 0 {
            return 30.0
        }
        
        let data = self.bubbleSection[indexPath.row - 1]
        
        return max(data.insets.top + data.view.frame.height + data.insets.bottom, 52)
    }
    
    // 返回自定义的TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MsgCell"
        
        if indexPath.row > 0 {
            let data = self.bubbleSection[indexPath.row - 1]
            let cell = TableViewCell(data: data, reuseIdentifier: cellId)
            return cell
        }else{
            return UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
