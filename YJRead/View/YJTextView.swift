//
//  YJTextField.swift
//  YJRead
//
//  Created by mx_in on 2020/9/28.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

extension ArticalModel {
    
    var displayText: String {
        var text = ""
        for paragraph in paragraphs {
            text.append("  \(paragraph)\n\n")
        }
        text.removeLast(2)
        return text
    }
    
}

class YJTextView: UITextView {
    
    private var textAttributes: [NSAttributedString.Key : Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 44
        return [NSAttributedString.Key.paragraphStyle : paragraphStyle]
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .clear
//        self.contentInset
        self.isEditable = false 
    }
    
    internal func setModel(_ artical: ArticalModel) {
        
        let attributedText = NSAttributedString(string: artical.displayText, attributes: textAttributes)
        self.attributedText = attributedText
    }

}
