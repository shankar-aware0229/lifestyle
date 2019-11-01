//
//  JourneySummaryPresenter.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import Foundation

class CategoriesDetailPresenter {
    private weak var wireframe: CategoriesDetailWireframe?
    private let interactor: CategoriesDetailInteractorInput
    weak var ui: CategoriesDetailUI?

    init(interactor: CategoriesDetailInteractorInput,
         wireframe: CategoriesDetailWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension CategoriesDetailPresenter: CategoriesDetailUser {
    func loaded() {
        interactor.loaded()
    }

    func appeared() {
        interactor.appeared()
    }

}

extension CategoriesDetailPresenter: CategoriesDetailInteractorOutput {
    
}
