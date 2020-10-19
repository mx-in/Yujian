//
//  SlideDownMenuCollectionView.swift
//  YJRead
//
//  Created by mx_in on 2020/10/17.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

class SlideDownMenuCollectionView: UICollectionView {

    let layout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    private func setup() {
        layout.estimatedItemSize = SlideMenuFrameData.itemSize
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.contentInset = UIEdgeInsets(top: SlideMenuFrameData.sideEdge, left: 0, bottom: 0, right: 0)
        self.register(SlideDownMenuCell.self, forCellWithReuseIdentifier: SlideDownMenuCell.identifier)
        self.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)
        self.layer.cornerRadius = 12.5
    }
}
