//
//  ArticalModelLoader.swift
//  YJRead
//
//  Created by mx_in on 2020/9/28.
//  Copyright © 2020 mx_in. All rights reserved.
//

import Foundation

final class ArticalModelLoader {
    
    let webService = WebService()

    func loadRandom(completion: @escaping (ArticalModel?) -> ()) {
        webService.load(MRYWArticalResource.random) { result in
            completion(result?.generateArticalModel())
        }
    }
    
    func loadToday(completion: @escaping (ArticalModel?) -> ()) {
        webService.load(MRYWArticalResource.today) { result in
            completion(result?.generateArticalModel())
        }
    }
}
