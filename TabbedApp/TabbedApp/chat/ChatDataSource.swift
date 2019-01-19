//
//  ChatDataSource.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/19.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

protocol ChatDataSource {
    /* 返回对话记录中的全部行数 */
    func rowsForChatTable(tableView: TableView) -> Int
    /* 返回某一行的内容 */
    func chatTableView(tableView: TableView, dataForRow: Int) -> MessageItem
}
