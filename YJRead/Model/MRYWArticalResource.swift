//
//  Artical.swift
//  YJRead
//
//  Created by mx_in on 2019/5/7.
//  Copyright © 2019 mx_in. All rights reserved.
//

import Foundation

struct MRYWArticalDate: Codable {
    let curr: String
    let prev: String
    let next: String
}

struct MRYWArticalData: Codable {
    let date: MRYWArticalDate
    let author: String
    let title: String
    let digest: String
    let content: String
    let wc: Int
}

struct MRYWArticalResource: Codable {
    let data: MRYWArticalData
}

extension MRYWArticalResource {
    static var random: Resource<MRYWArticalResource> {
        let randomArticalURL = URL(string: "https://interface.meiriyiwen.com/article/random?dev=1")!
        return Resource<MRYWArticalResource>(url: randomArticalURL)
    }
    
    static var today: Resource<MRYWArticalResource> {
        let todayAritcalURL = URL(string: "https://interface.meiriyiwen.com//article/today?dev=1")!
        return Resource<MRYWArticalResource>(url: todayAritcalURL)
    }
    
    func generateArticalModel() -> ArticalModel {
        let articalData = data
        return ArticalModel(date:articalData.date.curr ,
                            author: articalData.author,
                            title: articalData.title,
                            digest: articalData.digest,
                            paragraphs: articalData.paragraphs() ?? [String](),
                            wordCnt: articalData.wc)
    }
}

extension MRYWArticalData {
    func paragraphs() -> [String]? {
        if content.isEmpty {
            return nil
        }
        let range = NSRange(content.startIndex..<content.endIndex, in: content)
        let pattern = #"<p>(.*?)</p>"#
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        guard let reg = regex else {
            return nil
        }
        var result = [String]()
        reg.enumerateMatches(in: content, options: [], range: range) { (match, _, stop) in
            guard let match = match else { return }
            let frontPTagLen = 3
            let endPTagLen = 4
            let start = content.index(content.startIndex, offsetBy: match.range.location + frontPTagLen)
            let end = content.index(content.startIndex, offsetBy: match.range.location + match.range.length -
                                        endPTagLen)
            
            result.append(String(content[start..<end]))
        }
        return result
    }
}
