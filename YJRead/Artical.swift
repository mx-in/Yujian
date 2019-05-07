//
//  Artical.swift
//  YJRead
//
//  Created by mx_in on 2019/5/7.
//  Copyright © 2019 mx_in. All rights reserved.
//

import Foundation

struct Artical: Codable {
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

extension Artical {
    static var random: Resource<Artical> {
        let randomArticalURL = URL(string: "https://interface.meiriyiwen.com/article/random?dev=1")!
        return Resource<Artical>(url: randomArticalURL)
    }
    
    static var today: Resource<Artical> {
        let todayAritcalURL = URL(string: "https://interface.meiriyiwen.com//article/today?dev=1")!
        return Resource<Artical>(url: todayAritcalURL)
    }
}

