//
//  SecondViewController.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/10.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, ChatDataSource {
    var Chats: Array<MessageItem>!
    var tableView: TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupChatTable()
    }

    func setupChatTable(){
        self.tableView = TableView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        
        // 创建一个征用的单元格
        self.tableView!.register(TableViewCell.self, forCellReuseIdentifier: "MsgCell")
        
        let me = "xiaoming.png"
        let you = "xiaohua.png"
        
        let first = MessageItem(body: "嘿，这张照片咋样，我在泸沽湖拍的呢！", logo: me, date: NSDate(timeIntervalSinceNow: -600), mtype: .Mine)
        let second = MessageItem(image: UIImage(named: /*"luguhu.jpeg"*/"sz.png")!, logo: me, date: NSDate(timeIntervalSinceNow: -60), mtype: .Mine)
        let third = MessageItem(body: "太赞了，我也相去看那看看呢！", logo: you, date: NSDate(timeIntervalSinceNow: -60), mtype: .Someone)
        let forth = MessageItem(body: "嗯，下次我们一起去吧！", logo: me, date: NSDate(timeIntervalSinceNow: -20), mtype: .Mine)
        let fifth = MessageItem(body: "好的，一定！", logo: you, date: NSDate(timeIntervalSinceNow: 0), mtype: .Someone)
        
        Chats = [first, second, third, forth, fifth]
        
        self.tableView.chatDataSource = self
        self.tableView.reloadData()
        self.view.addSubview(self.tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func rowsForChatTable(tableView: TableView) -> Int {
        return self.Chats.count
    }
    
    func chatTableView(tableView: TableView, dataForRow: Int) -> MessageItem {
        return Chats[dataForRow]
    }
    

}

