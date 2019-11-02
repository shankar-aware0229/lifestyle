//
//  ParserTests.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import XCTest
@testable import Lifestyle

class ParserTests: XCTestCase {
    func test_whenNoDataIsPassedAnErrorIsReturned() {
        let parser = ComponentParser(data: nil)
        
        let result = parser.parse()
        
        XCTAssertEqual(result.error?.localizedDescription, ResponseError.noData.localizedDescription)
    }
    
    func test_whenWrongDataIsPassedAnErrorIsReturned() {
        let parser = ComponentParser(data: Data())
        
        let result = parser.parse()
        
        XCTAssertEqual(result.error?.localizedDescription, ResponseError.wrongData.localizedDescription)
    }
    
    func test_whenCorrectDataIsPassedAListIsReturned() {
        let parser = ComponentParser(data: JsonLoader.loadFile(named: "Products"))
        
        let result = parser.parse()
        
        XCTAssertEqual(result.value?.categories.count, 17)
        
        let firstCategory = result.value?.categories.first
        let firstProduct = result.value?.categories.first?.products?.first
        let firstVarient = result.value?.categories.first?.products?.first?.variants?.first
        
        XCTAssertEqual(firstCategory?.id, 1)
        XCTAssertEqual(firstCategory?.name, " Casuals")
        XCTAssertEqual(firstProduct?.id, 1)
        XCTAssertEqual(firstProduct?.name, "Nike Sneakers")
        XCTAssertEqual(firstProduct?.dateAdded, "2016-12-09T11:16:11.000Z")
        XCTAssertEqual(firstVarient?.id, 1)
        XCTAssertEqual(firstVarient?.color, "Blue")
        XCTAssertEqual(firstVarient?.size, 42)
        XCTAssertEqual(firstVarient?.price, 1000)
    }
}

class JsonLoader {
    static func loadFile(named name: String) -> Data? {
        let bundle = Bundle(for: JsonLoader.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
        return try? Data(contentsOf: url)
    }
}
