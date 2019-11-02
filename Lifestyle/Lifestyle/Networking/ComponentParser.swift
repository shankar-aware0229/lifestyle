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
            return "There is no data available. Please contact support team."// no data available on service fetch
        case .wrongData:
            return "Something went wrong, Please try again later!!!" // We can change this message to any custom and valid error message to user
        }
    }
}

struct ComponentParser {
    let data: Data?
    
    func parse() -> Result<LifeStyleModel> {
        guard let data = data else { return .failure(ResponseError.noData) }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let results = try decoder.decode(LifeStyleModel.self, from: data)
            return .success(results)
        } catch let error {
            print(error.localizedDescription)
            return .failure(ResponseError.wrongData)
        }
    
    }
}
