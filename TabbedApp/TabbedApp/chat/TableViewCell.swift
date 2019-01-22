//
//  TableViewCell.swift
//  TabbedApp
//
//  Created by alan king on 2019/1/18.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var customView: UIView!
    var bubbleImage: UIImageView!
    var avatarImage: UIImageView!
    var msgItem: MessageItem!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // - (void) setupInternalData
    init(data: MessageItem, reuseIdentifier cellId: String){
        self.msgItem = data
        super.init(style: .default, reuseIdentifier: cellId)
        rebuildUserInterface()
    }
    
    func rebuildUserInterface(){
        self.selectionStyle = .none
        if self.bubbleImage == nil{
            self.bubbleImage = UIImageView()
            self.addSubview(self.bubbleImage)
        }
        
        let type = self.msgItem.mtype
        let width = self.msgItem.view.frame.width
        let height = self.msgItem.view.frame.height
        
        var x = (type == ChatType.Someone) ? 0 : self.frame.width - width - self.msgItem.insets.left - self.msgItem.insets.right
        
        var y: CGFloat = 0
        // 显示用户头像
        if self.msgItem.user.username != "" {
            let thisUser = self.msgItem.user            
            //self.avatarImage.removeFromSuperview()
            
            let imageName = thisUser.avatar != "" ? thisUser.avatar : "noAvatar.png"
            self.avatarImage = UIImageView(image:UIImage(named:imageName))
            self.avatarImage.layer.cornerRadius = 9.0
            self.avatarImage.layer.masksToBounds = true
            self.avatarImage.layer.borderColor = UIColor(white: 0.0, alpha: 0.2).cgColor
            self.avatarImage.layer.borderWidth = 1.0
            
            // 别人头像，在左边，我的头像在右边
            let avatarX = (type == ChatType.Someone) ? 2 :self.frame.width -  52
            
            // 头像居于消息底部
            let avatarY = height
            // set the frame correctly
            self.avatarImage.frame = CGRect(x: avatarX, y: avatarY, width: 50, height: 50)
            self.addSubview(self.avatarImage)
            
            let delta = self.frame.height - (self.msgItem.insets.top + self.msgItem.insets.bottom + self.msgItem.view.frame.height)
            if delta > 0 {
                y = delta
            }
            
            if type == ChatType.Someone {
                x += 54
            }
            
            if type == ChatType.Mine {
                x -= 54
            }
        }
        
        self.customView = self.msgItem.view
        self.customView.frame = CGRect(x: x + self.msgItem.insets.left, y: y + self.msgItem.insets.top, width: width, height: height)
        
        self.addSubview(self.customView)
        
        // 如果是别人的消息，在左边，如果是我输入的消息，在右边
        if type == ChatType.Someone {
            self.bubbleImage.image = UIImage(named: "yoububble.png")!.stretchableImage(withLeftCapWidth: 21, topCapHeight: 14)
        }else{
            self.bubbleImage.image = UIImage(named: "mebubble.png")!.stretchableImage(withLeftCapWidth: 15, topCapHeight: 14)
        }
        
        
        self.bubbleImage.frame = CGRect(x: x, y: y, width: width + self.msgItem.insets.left + self.msgItem.insets.right, height: height + self.msgItem.insets.top + self.msgItem.insets.bottom)
        
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
