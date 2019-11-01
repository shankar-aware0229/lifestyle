//
//  LifeStyleError.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation

enum ResponseError: Error, LocalizedError, Equatable {
    case noData
    case wrongData
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "There is no data"
        case .wrongData:
            return "You got something else!"
        }
    }
}

struct ComponentParser {
    let data: Data?
    
    func parse() -> Result<[LifeStyleModel]> {
        guard let data = data else { return .failure(ResponseError.noData) }
        
        let decoder = JSONDecoder()
        guard let results = try? decoder.decode([LifeStyleModel].self, from: data) else {
            return .failure(ResponseError.wrongData)
        }
        
        return .success(results)
    }
}
