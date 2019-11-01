//
//  LifeStyleResult.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation

/*
 1. Gets a url
 2. Downloads content
 3. Parses response
 4. Outputs result
 5. Allows sorting result
 6. If no response/there is an error, output error message
*/

enum Result<Value> {
    case success(Value)
    case failure(Error)
    
    var value: Value? {
        switch self {
        case .success(let val): return val
        default: return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .failure(let val): return val
        default: return nil
        }
    }
}

protocol AnyCategoryRepository {
    init(url: URL?)
    func getComponents(_ completion: @escaping ((Result<[LifeStyleModel]>) -> Void))
}

enum NetworkError: Error, LocalizedError, Equatable {
    case invalidURL
    
    var errorDescription: String? { return "URL is incorrect" }
}

class NetworkCategoryRepository: AnyCategoryRepository {
    private let url: URL?
    
    required init(url: URL?) {
        self.url = url
    }
    
    func getComponents(_ completion: @escaping ((Result<[LifeStyleModel]>) -> Void)) {
        guard let url = self.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            let result = ComponentParser(data: data).parse()
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
