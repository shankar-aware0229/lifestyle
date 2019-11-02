//
//  LifestyleTests.swift
//  LifestyleTests
//
//  Created by SAGAR THAKARE on 30/10/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import XCTest
@testable import Lifestyle

class CategoriesListViewTests: XCTestCase {
    
    func test_whenScreenLoadsTheOutletsAreSet() {
        // Assuming
        let lab = Lab.standard()
        
        // When
        lab.load()
        
        // Then
        XCTAssertEqual(lab.sut.title, "Lifestyle")
        XCTAssertFalse(lab.sut.collectionView.isHidden)
        XCTAssertFalse(lab.sut.activityIndicator.isHidden)
    }
    
    //TODO:
    func test_whenServerFailsAnErrorIsShown() {
        let lab = Lab.standard()
        lab.load()
        
    
      // XCTAssertTrue(lab.sut.collectionView.isHidden)
      // XCTAssertFalse(lab.sut.activityIndicator.isAnimating)
    }
    
    //TODO:
    func test_whenGettingZeroResultsAMessageIsShown() {
        let lab = Lab.standard()
//        lab.repository.results = [.success([])]
//        lab.load()
//
//        lab.sut.refreshList()
//
//        XCTAssertTrue(lab.sut.collectionView.isHidden)
//        XCTAssertFalse(lab.sut.activityIndicator.isAnimating)
//        XCTAssertFalse(lab.sut.errorLabel.isHidden)
//        XCTAssertEqual(lab.sut.errorLabel.text, "No Results")
    }
    
    //TODO:
    func test_whenItemsAreFetchedTheyArePresentedInTheCollectionView() {
        let lab = Lab.standard()
    }
    
    //TODO:
    func test_whenResultsAreDisplayedTheCellIsConfiguredCorrectly() {
        let lab = Lab.standard()
    }
}

private class Lab {
    let wireframe = Wireframe()
    var sut: CategoriesListView!
    let repo = Repository(url: URL(string: "https://fake.herokuapp.com/json"))
    
    class func standard() -> Lab {
        let lab = Lab()
        let entity = CategoriesListEntity(herokuUrl: "https://fake.herokuapp.com/json")
        lab.sut = CategoriesListAssembler(entity: entity)
            .assemble(with: lab.wireframe)
            .viewController as? CategoriesListView
        return lab
    }
    
    func load() {
        sut.loadViewIfNeeded()
    }
    
    func appear() {
        load()
        sut.viewWillAppear(false)
    }
    
    
    class Wireframe: CategoriesListWireframe {
        var exit: Bool = false
        var info: Categories?
        
        func showSubCategories(with info: Categories) {
            self.info = info
            exit = true
        }
    }
    
    
    // Inner types
    
    class Repository: AnyCategoryRepository {
        var results: [Result<LifeStyleModel>]
        
        required init(url: URL?) {
            results = [.failure(TestError.noResult)]
        }
        
        func getCategoriesDetails(_ completion: @escaping ((Result<LifeStyleModel>) -> Void)) {
            guard results.count > 0 else {
                completion(.failure(TestError.noResult))
                return
            }
            completion(results.removeFirst())
        }
    }
    
    enum TestError: Error, LocalizedError, Equatable {
        case noResult
        
        var errorDescription: String? { return "Test Error" }
    }
}

struct CreateResults {
    static func build() -> LifeStyleModel {
        return LifeStyleModel(categories: [], rankings: [])
    }
}
