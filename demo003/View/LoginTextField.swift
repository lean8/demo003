//
//  LoginTextField.swift
//  demo003
//
//  Created by lean on 2021/7/19.
//

import UIKit

class LoginTextField: UITextField {

    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        self.frame.size.height = 34
        
        self.textColor = UIColor(named: "LightYellowColor")
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height-1, width: self.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(bottomLine)
    }

}
