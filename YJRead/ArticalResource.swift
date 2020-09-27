//
//  Artical.swift
//  YJRead
//
//  Created by mx_in on 2019/5/7.
//  Copyright © 2019 mx_in. All rights reserved.
//

import Foundation

struct ArticalResource: Codable {
    struct ArticalData: Codable {
        struct ArticalDate: Codable {
            let curr: String
            let prev: String
            let next: String
        }
        let date: ArticalDate
        let author: String
        let title: String
        let digest: String
        let content: String
        let wc: Int
    }
    let data: ArticalData
}

extension ArticalResource {
    static var random: Resource<ArticalResource> {
        let randomArticalURL = URL(string: "https://interface.meiriyiwen.com/article/random?dev=1")!
        return Resource<ArticalResource>(url: randomArticalURL)
    }
    
    static var today: Resource<ArticalResource> {
        let todayAritcalURL = URL(string: "https://interface.meiriyiwen.com//article/today?dev=1")!
        return Resource<ArticalResource>(url: todayAritcalURL)
    }
}
