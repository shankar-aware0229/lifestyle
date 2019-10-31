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

    func appeared() {
        interactor.appeared()
    }

}

extension CategoriesListPresenter: CategoriesListInteractorOutput {
    
}
