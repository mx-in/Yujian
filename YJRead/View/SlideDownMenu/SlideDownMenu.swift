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
    static let topMargin: CGFloat = 13.0
}

struct SlideMenuAnimationData {
    static let duration = 0.2
    static let delay = 0.0
    static let springDamping: CGFloat = 0.8
    static let spirngVelocity: CGFloat = 15.0
}

enum SlideMeunPosition {
    case leftBottom
    case rightBottom
}

class SlideDownMenu: UIView {

    fileprivate var items = [YJSlideDownItem]() {
        didSet {
            itemsCollectionView.reloadData()
        }
    }
    fileprivate let itemsCollectionView: SlideDownMenuCollectionView = {
        let menuCollectionView = SlideDownMenuCollectionView()
        menuCollectionView.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0) // support top right -> bottom left animation style
        return menuCollectionView
    }()

    public init(items: [YJSlideDownItem]) {
        super.init(frame: .zero)
        self.items = items
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func show(in view: UIView, relativeTo positioningView: UIView, preferredPosition: SlideMeunPosition) {
        self.frame = view.frame
        view.addSubview(self)
        
        updateFrame(relativeTo: positioningView, preferredPosition: preferredPosition)
        setupShadow()
        addShowAnimation()
    }
    
    func dismiss() {
        UIView.animate(withDuration: SlideMenuAnimationData.duration,
                                delay: SlideMenuAnimationData.delay,
                                usingSpringWithDamping: SlideMenuAnimationData.springDamping,
                                initialSpringVelocity: SlideMenuAnimationData.spirngVelocity,
                                options: .curveEaseOut) {
            self.alpha = 0.0
            self.itemsCollectionView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        } completion: { completion in
            self.removeFromSuperview()
        }
    }
    
    private func addShowAnimation() {
        itemsCollectionView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        itemsCollectionView.alpha = 0.0
        UIView.animate(withDuration: SlideMenuAnimationData.duration,
                       delay: SlideMenuAnimationData.delay,
                       usingSpringWithDamping: SlideMenuAnimationData.springDamping,
                       initialSpringVelocity: SlideMenuAnimationData.spirngVelocity,
                       options: .curveEaseIn) {
            self.itemsCollectionView.alpha = 1.0
            self.itemsCollectionView.transform = CGAffineTransform.identity
        }
    }
    
    private func addDismissAnimation() {
    }
    
    private func updateFrame(relativeTo positioningView: UIView, preferredPosition: SlideMeunPosition) {
        let itemsCnt = items.count
        let height = CGFloat(itemsCnt) * SlideMenuFrameData.itemHeight
        let verticalEdge = SlideMenuFrameData.sideEdge * 2
        let size = CGSize(width: SlideMenuFrameData.width, height: height + verticalEdge)
        var origin:CGPoint = .zero

        let positionViewFrame = positioningView.globalFrame ?? positioningView.frame
        switch preferredPosition {
        case .leftBottom:
            origin.x = positionViewFrame.origin.x - SlideMenuFrameData.width
            origin.y = positionViewFrame.origin.y + positionViewFrame.size.height + SlideMenuFrameData.topMargin
            break
        case .rightBottom:
            origin.x = positionViewFrame.origin.x + positionViewFrame.size.width - SlideMenuFrameData.width
            origin.y = positionViewFrame.origin.y + positionViewFrame.size.height + SlideMenuFrameData.topMargin
        }
        itemsCollectionView.frame = CGRect(x: origin.x, y: origin.y, width: size.width, height: size.height)
    }
    
    private func setupShadow() {
        itemsCollectionView.layer.masksToBounds = false
        itemsCollectionView.layer.shadowColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.4784313725, alpha: 0.5).cgColor
        itemsCollectionView.layer.shadowRadius = 12.5
        itemsCollectionView.layer.shadowOffset = CGSize(width: 1, height: 1)
        itemsCollectionView.layer.shadowPath = UIBezierPath(rect: itemsCollectionView.bounds).cgPath
        itemsCollectionView.layer.shadowOpacity = 1
    }
    
    private func setup() {
        self.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 0.47)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView(_:))))
        
        self.addSubview(itemsCollectionView)
        self.itemsCollectionView.dataSource = self
        
    }
    
    @objc private func didTapView(_ tapGesture: UITapGestureRecognizer) {
        dismiss()
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









