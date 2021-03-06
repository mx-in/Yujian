//
//  YJReadTests.swift
//  YJReadTests
//
//  Created by mx_in on 2020/9/27.
//  Copyright © 2020 mx_in. All rights reserved.
//

import XCTest
@testable import YJRead

class DataParseTests: XCTestCase {

    let webService = WebService()
    
    let jsonStr = " {\"data\":{\"date\":{\"curr\":\"20200909\",\"prev\":\"20200908\",\"next\":\"20200910\"},\"author\":\"陈忠\",\"title\":\"最初的晚餐\",\"digest\":\"想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国\",\"content\":\"<p>想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国人共进的晚餐。<\\/p><p>我能进入那个接待作陪的名单，是因为我在《陕西文艺》上刚刚发表过两个短篇小说，都是注释演绎“阶级斗争”这个“纲”的，而且是被认为演绎注释得不错的。接待作陪的人员组成考虑到方方面面，大学革委会主任、革命演员、革命工程师等，我也算革命的工农兵业余作者。陕西最具影响的几位作家几棵大树都被整垮了，我怎么也清楚我是猴子称王的被列入……<\\/p>\",\"wc\":1453}}"
    
    override func setUpWithError() throws {
        webService.isMock = true
        webService.testJsonData = jsonStr
    }

    override func tearDownWithError() throws {
        
    }
    
    func testDataParse() throws {
        webService.load(MRYWArticalResource.today) { result in
            XCTAssertTrue(result != nil, "get data failed")
            XCTAssertEqual(result?.data.date.prev, "20200908")
            XCTAssertEqual(result?.data.content.isEmpty, false)
        }
    }
    
    func testParagraphsGenerate() {
        webService.load(MRYWArticalResource.today) { result in
            let res =  result?.data.paragraphs()
            XCTAssertNotEqual(res, nil)
            XCTAssertEqual(res?.count, 2)
        }
    }
    
    func testModelGenerate() {
        webService.load(MRYWArticalResource.today) { result in
            let model = result?.generateArticalModel()
            XCTAssertEqual(model?.author, result?.data.author)
            XCTAssertEqual(model?.date, result?.data.date.curr)
            XCTAssertEqual(model?.title, result?.data.title)
            XCTAssertEqual(model?.digest, result?.data.digest)
            XCTAssertEqual(model?.paragraphs.count, result?.data.paragraphs()?.count)
            XCTAssertEqual(model?.wordCnt, result?.data.wc)
        }
    }
    
    func testArticalLoader() {
        let loader = ArticalModelLoader()
        loader.webService = webService
        
        loader.loadRandom { result in
            XCTAssertTrue(result != nil, "get data failed")
            XCTAssertEqual(result!.date, "20200909")
            XCTAssertEqual(result!.wordCnt, 1453)
            XCTAssertEqual(result!.paragraphs.count, 2)
            XCTAssertEqual(result!.title, "最初的晚餐")
            XCTAssertEqual(result!.digest, "想到这件难忘的事，忽然联想到“最后的晚餐”这幅名画的名字，不过对我来说，那一次难忘的晚餐不是最后的，而是最初的一次，这就是我平生第一次陪外国")
        }
        
    }


}
