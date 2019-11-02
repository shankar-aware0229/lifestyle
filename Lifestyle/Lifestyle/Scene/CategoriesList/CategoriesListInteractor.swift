//
//  CategoriesListInteractor.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import Foundation

class CategoriesListInteractor {
    weak var output: CategoriesListInteractorOutput?
    private let entity: CategoriesListEntity
    private let repo: AnyCategoryRepository
    private var categories: [Categories] = []
    
    init(entity: CategoriesListEntity) {
        self.entity = entity
        self.repo = NetworkCategoryRepository(url: URL(string: entity.herokuUrl))
    }
}

extension CategoriesListInteractor: CategoriesListInteractorInput {
    func loaded() {
        repo.getCategoriesDetails { [weak self] result in
            switch result {
            case .failure(let error):
                self?.handleError(error)
            case .success(let list):
                self?.handleSuccess(list)
            }
        }
    }
    
    func selectCategory(at index: Int) {
        let category = categories[index]
        output?.sendProductDetails(category)
    }
}


private extension CategoriesListInteractor {
    private func handleError(_ error: Error) {
         output?.failed(with: error)
    }

    private func handleSuccess(_ result: LifeStyleModel) {
        categories = result.categories
        output?.prepare(result)
    }
}

