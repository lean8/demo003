//
//  SaySometingTextView.swift
//  demo003
//
//  Created by lean on 2021/7/19.
//

import UIKit

class SaySometingTextView: UITextView, UITextViewDelegate {

    override func draw(_ rect: CGRect) {
        self.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        self.text = "想說點什麼呢..."
        self.textColor = .white
        self.delegate = self
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        order.saySomething = self.text
    }

}
