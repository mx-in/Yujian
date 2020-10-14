//
//  YJSlideDownMenu.swift
//  YJRead
//
//  Created by mx_in on 2020/10/12.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

struct YJSlideDownItem {
    let title: String
    let icon: UIImage
    let action: ()->()
}

class YJSlideDownMenu: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func show(in view: UIView) {
        self.frame = view.frame
        view.addSubview(self)
    }
    
    private func setup() {
        self.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 0.47)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView(_:))))
    }
    
    @objc private func didTapView(_ tapGesture: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
}
