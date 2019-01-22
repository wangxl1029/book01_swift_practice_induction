//
//  SecondViewController.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/10.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, ChatDataSource, UITextFieldDelegate {
    var Chats: Array<MessageItem>!
    var me:UserInfo!
    var you:UserInfo!
    var tableView: TableView!
    var txtMsg: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSendPanel()
        setupChatTable()
    }

    func setupChatTable(){
        
        self.tableView = TableView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 76 - (self.tabBarController?.tabBar.frame.height)! ) )
        
        // 创建一个征用的单元格
        self.tableView!.register(TableViewCell.self, forCellReuseIdentifier: "ChatCell")
        
        let me = UserInfo(name:"Xiaoming" ,logo:("xiaoming.png"))
        let you = UserInfo(name:"Xiaohua" ,logo:("xiaohua.png"))
        
        let first = MessageItem(body: "嘿，这张照片咋样，我在泸沽湖拍的呢！", user: me, date: NSDate(timeIntervalSinceNow: -600), mtype: .Mine)
        let second = MessageItem(image: UIImage(named: /*"luguhu.jpeg"*/"sz.png")!, user: me, date: NSDate(timeIntervalSinceNow: -60), mtype: .Mine)
        let third = MessageItem(body: "太赞了，我也想去看那看看呢！", user: you, date: NSDate(timeIntervalSinceNow: -60), mtype: .Someone)
        let forth = MessageItem(body: "嗯，下次我们一起去吧！", user: me, date: NSDate(timeIntervalSinceNow: -20), mtype: .Mine)
        let fifth = MessageItem(body: "好的，一定！", user: you, date: NSDate(timeIntervalSinceNow: 0), mtype: .Someone)
        
        Chats = [first, second, third, forth, fifth]
        // Allen: 下面这个for loop是为了验证table view scroll to the bottom
        /*
         for _ in 1...10 {
         Chats.append(MessageItem(body: "好的，一定！", user: you, date: NSDate(timeIntervalSinceNow: 0), mtype: .Someone))
         }
         */
        
        self.tableView.chatDataSource = self
        self.tableView.reloadData()
        self.view.addSubview(self.tableView)
    }
    
    func setupSendPanel() {
        // Allen: 原书send view内嵌在single view中，且其UIView的y为502
        //        下面的send view是内嵌在tabbed view中，其UIView的y要考虑tab bar的高
        let sendView = UIView(frame: CGRect(x: 0, y: self.view.frame.height - (self.tabBarController?.tabBar.frame.height)! - 56 , width: 320, height: 56))
        sendView.backgroundColor =  UIColor.blue
        sendView.alpha = 0.9
        
        txtMsg = UITextField(frame: CGRect(x: 7, y: 10, width: 225, height: 36))
        txtMsg.backgroundColor = UIColor.white
        txtMsg.textColor = UIColor.black
        txtMsg.layer.cornerRadius = 10.0
        txtMsg.returnKeyType = .send
        
        // set the delegate so you can respond to user input
        txtMsg.delegate = self
        sendView.addSubview(txtMsg)
        self.view.addSubview(sendView)
     
        let sendButton = UIButton(frame: CGRect(x: 235, y: 10, width: 77, height: 36))
        sendView.backgroundColor = UIColor.lightGray
        sendButton.addTarget(self, action: #selector(SecondViewController.sendMessage), for: .touchUpInside)
        
        sendButton.layer.cornerRadius = 6.0
        sendButton.setTitle("发送", for: .normal)
        
        sendView.addSubview(sendButton)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    }
    
    @objc func sendMessage(){
        // composing = false
        let sender = txtMsg
        
        if let txt = sender?.text as NSString? {
            let thisChat = MessageItem(body: txt, user: me, date: NSDate(), mtype: ChatType.Mine)
            
            let thatChat = MessageItem(body: "你说的是：\(txt)" as NSString, user: you, date: NSDate(), mtype: ChatType.Someone)
            
            Chats.append(thisChat)
            Chats.append(thatChat)
            self.tableView.chatDataSource = self
            self.tableView.reloadData()
            
            //self.showTableView
            sender?.resignFirstResponder()
            sender?.text = ""
        }
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

