//
//  GroupCell.swift
//  demo003
//
//  Created by lean on 2021/7/16.
//

import UIKit

class GroupCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectAction))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func selectAction() {
        userInfo.userGroup = self.textLabel!.text!
        print(userInfo.userGroup)
        // pop up 縮回
        NotificationCenter.default.post(name: NSNotification.Name("hideGroupSelection"), object: nil)
    }

}
