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


struct SlideMenuFrameData {
    static let itemHeight: CGFloat = 31.0
    static let itemWidth: CGFloat = 105.5
    static let width: CGFloat = 134.0
    static let sideEdge: CGFloat = 13.0
    static let itemSize: CGSize = CGSize(width: itemWidth, height: itemHeight)
}

class SlideDownMenu: UIView {

    fileprivate var items = [YJSlideDownItem]()
    fileprivate let itmesCollectionView = SlideDownMenuCollectionView()

    public init(items: [YJSlideDownItem]) {
        super.init(frame: .zero)
        setup()
        self.items = items
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func show(in view: UIView, relativeTo positioningView: UIView, preferredEdge: (CGRectEdge, CGRectEdge)) {
        self.frame = view.frame
        view.addSubview(self)
        updateFrame(relativeTo: positioningView, preferredEdge: preferredEdge)
    }
    
    private func updateFrame(relativeTo positioningView: UIView, preferredEdge: (CGRectEdge, CGRectEdge)) {
        let itemsCnt = items.count
        let height = CGFloat(itemsCnt) * SlideMenuFrameData.itemHeight
        let verticalEdge = SlideMenuFrameData.sideEdge * 2
        let size = CGSize(width: SlideMenuFrameData.width, height: height + verticalEdge)
        var origin:CGPoint = .zero

        let positionViewFrame = positioningView.globalFrame ?? positioningView.frame
        if preferredEdge.0 == CGRectEdge.minXEdge, preferredEdge.1 == CGRectEdge.maxYEdge {
            origin.x = positionViewFrame.origin.x - SlideMenuFrameData.width
            origin.y = positionViewFrame.origin.y + positionViewFrame.size.height
        }
        itmesCollectionView.frame = CGRect(x: origin.x, y: origin.y, width: size.width, height: size.height)
    }
    
    private func setup() {
        self.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 0.47)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView(_:))))
        
        self.addSubview(itmesCollectionView)
        self.itmesCollectionView.dataSource = self
        
        let item1 = YJSlideDownItem(title: "item1", icon: UIImage()) {
            
        }
        let item2 = YJSlideDownItem(title: "item1", icon: UIImage()) {
            
        }
        items = [item1, item2]
        itmesCollectionView.reloadData()
    }
    
    @objc private func didTapView(_ tapGesture: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
}

extension SlideDownMenu: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: SlideDownMenuCell.identifier, for: indexPath) as! SlideDownMenuCell
        cell.setItem(items[indexPath.row])
        return cell
    }

}









