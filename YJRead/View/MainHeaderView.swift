//
//  MainHeaderView.swift
//  YJRead
//
//  Created by mx_in on 2020/9/28.
//  Copyright © 2020 mx_in. All rights reserved.
//

import UIKit

@IBDesignable
class MainHeaderView: UIView {
    
    let nibName = "MainHeaderView"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var settingBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        guard let view = loadViewFromNib() else { return }
               view.frame = self.bounds
               self.addSubview(view)
    }
    
    func setModel(_ model: ArticalModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.author
    }

    func loadViewFromNib() -> UIView? {
          let bundle = Bundle(for: type(of: self))
          let nib = UINib(nibName: nibName, bundle: bundle)
          return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func addSettingTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        settingBtn.addTarget(target, action: action, for: controlEvents)
    }
    
}
