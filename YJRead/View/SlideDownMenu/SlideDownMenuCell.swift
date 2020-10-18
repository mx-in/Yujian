//
//  SlidMenuCell.swift
//  YJRead
//
//  Created by mx_in on 2020/10/16.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

class SlideDownMenuCell: UICollectionViewCell {
    static let identifier = "SlideDownMenuCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setItem(_ item: YJSlideDownItem) {
        
    }
    
    private func setup() {
        self.backgroundColor = .lightGray
    }
}
