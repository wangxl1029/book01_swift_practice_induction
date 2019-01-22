//
//  TableHeaderViewCell.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/21.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class TableHeaderViewCell: UITableViewCell {

    var height: CGFloat = 30.0
    var label: UILabel!
    
    init(reuseIdentifier cellId: String?) {
        super.init(style: .default, reuseIdentifier: cellId)
    }
    
    class func getHeight() -> CGFloat {
        return 30.0
    }
    
    func setData(value: Date) {
        self.height = 30
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        let text = dateFormatter.string(from: value)
        
        if self.label != nil {
            self.label.text = text
            return
        }
        
        self.selectionStyle = .none
        self.label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: height))
        self.label.text = text
        self.label.font = UIFont.boldSystemFont(ofSize: 12)
        
        self.label.textAlignment = .center
        self.label.shadowOffset = CGSize(width: 0, height: 1)
        self.label.shadowColor = UIColor.white
        
        self.label.textColor = UIColor.darkGray
        self.label.backgroundColor = UIColor.clear
        self.addSubview(self.label)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
