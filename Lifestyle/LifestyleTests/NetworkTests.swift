//
//  NetworkTests.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import XCTest
@testable import Lifestyle

class NetworkTests: XCTestCase {
    func test_whenWrongURLIsProvidedNetworkWillFail() {
        let network = NetworkCategoryRepository(url: nil)
        
        let exp = expectation(description: "Done")
        
        network.getCategoriesDetails { result in
            let error = result.error
            
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, "URL is incorrect")
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func test_networkReturnsOnMainThread() {
        let url: URL = URL(string: "https://www.google.com/anything/you/cando")!
        let network = NetworkCategoryRepository(url: url)
        
        let exp = expectation(description: "Done")
        
        network.getCategoriesDetails { result in
            
            XCTAssertTrue(Thread.isMainThread)
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func test_networkReturnsWithWrongDataAParsingErrorIsReturned() {
        let url: URL = URL(string: "https://www.google.com")!
        let network = NetworkCategoryRepository(url: url)
        
        let exp = expectation(description: "Done")
        
        network.getCategoriesDetails { result in
            let error = result.error
            
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, ResponseError.wrongData.localizedDescription)

            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }

}
