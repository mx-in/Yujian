//
//  ViewController.swift
//  YJRead
//
//  Created by mx_in on 2017/6/25.
//  Copyright © 2017年 mx_in. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: MainHeaderView!
    @IBOutlet weak var textView: YJTextView!
    let floatView = FloatView()
    
    var artical: MRYWArticalResource?
    let loader: ArticalModelLoader = {
        let loader = ArticalModelLoader()
        
//        loader.webService.isMock = true
//        loader.webService.testJsonData = jsonStr
        
        return loader
    }()
    
    static let jsonStr = " {\"data\":{\"date\":{\"curr\":\"20200909\",\"prev\":\"20200908\",\"next\":\"20200910\"},\"author\":\"陈忠实\",\"title\":\"最初的晚餐\",\"digest\":\"想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国\",\"content\":\"<p>想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国人共进的晚餐。<\\/p><p>我能进入那个接待作陪的名单，是因为我在《陕西文艺》上刚刚发表过两个短篇小说，都是注释演绎“阶级斗争”这个“纲”的，而且是被认为演绎注释得不错的。接待作陪的人员组成考虑到方方面面，大学革委会主任、革命演员、革命工程师等，我也算革命的工农兵业余作者。陕西最具影响的几位作家几棵大树都被整垮了，我怎么也清楚我是猴子称王的被列入……<\\/p><p>想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国人共进的晚餐。<\\/p><p>我能进入那个接待作陪的名单，是因为我在《陕西文艺》上刚刚发表过两个短篇小说，都是注释演绎“阶级斗争”这个“纲”的，而且是被认为演绎注释得不错的。接待作陪的人员组成考虑到方方面面，大学革委会主任、革命演员、革命工程师等，我也算革命的工农兵业余作者。陕西最具影响的几位作家几棵大树都被整垮了，我怎么也清楚我是猴子称王的被列入……<\\/p><p>想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国人共进的晚餐。<\\/p><p>我能进入那个接待作陪的名单，是因为我在《陕西文艺》上刚刚发表过两个短篇小说，都是注释演绎“阶级斗争”这个“纲”的，而且是被认为演绎注释得不错的。接待作陪的人员组成考虑到方方面面，大学革委会主任、革命演员、革命工程师等，我也算革命的工农兵业余作者。陕西最具影响的几位作家几棵大树都被整垮了，我怎么也清楚我是猴子称王的被列入……<\\/p><p>想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国人共进的晚餐。<\\/p><p>我能进入那个接待作陪的名单，是因为我在《陕西文艺》上刚刚发表过两个短篇小说，都是注释演绎“阶级斗争”这个“纲”的，而且是被认为演绎注释得不错的。接待作陪的人员组成考虑到方方面面，大学革委会主任、革命演员、革命工程师等，我也算革命的工农兵业余作者。陕西最具影响的几位作家几棵大树都被整垮了，我怎么也清楚我是猴子称王的被列入……<\\/p>\",\"wc\":1453}}"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadRandom()
        headerView.addSettingTarget(self, action: #selector(didClickSettingBtn(_:)), for: .touchUpInside)
    }
    
    fileprivate func loadRandom() {
        loader.loadRandom { artical in
            guard let artical = artical else { return }
            self.headerView.setModel(artical)
            self.textView.setModel(artical)
        }
    }
    
// MARK: Actions
    
    @objc func didClickSettingBtn(_ sender: UIButton) {
        let menu = SlideDownMenu(items: menuItems())
        menu.show(in: self.view, relativeTo: headerView.settingBtn, preferredPosition: .rightBottom)
    }

}

extension ViewController {
    
    func menuItems() -> [YJSlideDownItem] {
        return [
            YJSlideDownItem(title: "随机一篇", icon: UIImage(named: "slide_down_menu_random")!) {
                self.loadRandom()
            },
            YJSlideDownItem(title: "收藏", icon: UIImage(named: "slide_down_menu_save")!) {
                
            },
            YJSlideDownItem(title: "分享", icon: UIImage(named: "slide_down_menu_share")!) {
                
            },
            YJSlideDownItem(title: "我的收藏", icon: UIImage(named: "slide_down_menu_collection")!) {
                
            },
            YJSlideDownItem(title: "设置", icon: UIImage(named: "slide_down_menu_setting")!) {
                
            }]
    }
    
}

