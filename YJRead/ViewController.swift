//
//  ViewController.swift
//  YJRead
//
//  Created by mx_in on 2017/6/25.
//  Copyright © 2017年 mx_in. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var headerView: MainHeaderView!
    
    var artical: MRYWArticalResource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebService().load(MRYWArticalResource.today) { result in
            guard let artical = result else {
                return
            }
            self.artical = artical
            
            DispatchQueue.main.async {
                self.webView.loadHTMLString(artical.data.content, baseURL: Bundle.main.bundleURL)
                self.title = artical.data.title
            }
        }
    }
    
    @IBAction func didClickPreBtn(_ sender: Any) {
        
    }
    
    @IBAction func didClickNextBtn(_ sender: Any) {
    }
    
    func didClickRandomBtn(_ sender: Any) {
        WebService().load(MRYWArticalResource.random) { result in
                   guard let artical = result else {
                       return
                   }
                   
                   DispatchQueue.main.async {
                       self.webView.loadHTMLString(artical.data.content, baseURL: Bundle.main.bundleURL)
                       self.title = artical.data.title
                   }
               }
    }
    
    
}

