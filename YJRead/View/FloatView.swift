//
//  FloatView.swift
//  YJRead
//
//  Created by mx_in on 2020/9/29.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

class FloatView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    fileprivate func setup() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.addGestureRecognizer(panGesture)
        self.backgroundColor = .yellow
    }
    
    @objc private func handlePan(_ pan: UIPanGestureRecognizer) {
        let point = pan.translation(in: self)
        self.center = CGPoint(x: center.x + point.x, y: center.y + point.y)
        pan.setTranslation(CGPoint(x: 0, y: 0), in: self)
    }
    
}
