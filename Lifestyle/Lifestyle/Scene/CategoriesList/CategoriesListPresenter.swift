//
//  JourneySummaryPresenter.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import Foundation

class CategoriesListPresenter {
    private weak var wireframe: CategoriesListWireframe?
    private let interactor: CategoriesListInteractorInput
    weak var ui: CategoriesListUI?

    init(interactor: CategoriesListInteractorInput,
         wireframe: CategoriesListWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension CategoriesListPresenter: CategoriesListUser {
    func loaded() {
        interactor.loaded()
    }
    
    func selectCategory(at index: Int) {
        interactor.selectCategory(at: index)
    }
}

extension CategoriesListPresenter: CategoriesListInteractorOutput {
    func prepare(_ info: LifeStyleModel) {
        guard info.categories.count > 0 else {
            //TODO: handle Error
            return
        }
        ui?.showResult(info.categories)
    }
    
    func failed(with: Error) {
        //TODO: handle Error
    }
    
    func sendProductDetails(_ category: Categories) {
        wireframe?.showSubCategories(with: category)
    }
}
