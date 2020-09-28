//
//  File.swift
//  YJRead
//
//  Created by mx_in on 2019/4/30.
//  Copyright © 2019 mx_in. All rights reserved.
//

import Foundation

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
}

extension Resource where A: Codable{
    init(url: URL) {
        self.url = url
        self.parse = { data in
            let model = try? JSONDecoder().decode(A.self, from: data)
            return model
        }
    }
}

final class WebService {
    
    var isMock = false
    var testJsonData: String?

    func load<A>(_ resource: Resource<A>, completion: @escaping (A?) -> ()) {
        
        if isMock {
            guard let json = testJsonData else {
                completion(nil)
                return
            }
            loadMock(resource, testJsonData: json, completion: completion)
            return
        }
        
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            let result = data.flatMap(resource.parse)
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
    
    func loadMock<A>(_ resource: Resource<A>, testJsonData: String, completion: @escaping (A?) -> ()) {
        let data = testJsonData.data(using: .utf8)
        completion(data.flatMap(resource.parse))
    }
    
}
