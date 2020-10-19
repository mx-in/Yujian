//
//  SlidMenuCell.swift
//  YJRead
//
//  Created by mx_in on 2020/10/16.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

extension UIView {
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return left + width
        }
        set {
            self.frame.origin.x = newValue - width
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return top + height
        }
        set {
            self.top = newValue - height
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
}

class SlideDownMenuCell: UICollectionViewCell {
    static let identifier = "SlideDownMenuCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.3607843137, green: 0.3607843137, blue: 0.3607843137, alpha: 1)
        return label
    }()
    
    let icon = UIImageView()
    
    var item: YJSlideDownItem?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setItem(_ item: YJSlideDownItem) {
        self.item = item
        label.text = item.title
        icon.image = item.icon
        icon.sizeToFit()
        label.sizeToFit()
    }
    
    private func setup() {
        addSubview(label)
        addSubview(icon)
        icon.left = 10
        icon.top = 6
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTabCell(_:))))
    }
    
    @objc func didTabCell(_ gesture: UITapGestureRecognizer) {
        if let action = item?.action {
            action()
        }
        
        if let superview = self.superview?.superview, superview.isMember(of: SlideDownMenu.self) {
            (superview as! SlideDownMenu).dismiss()
        }
    }
    
    override func layoutSubviews() {
        label.left = icon.right + 11
        label.center.y = icon.center.y
    }
}
