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

    init(entity: CategoriesListEntity) {
        self.entity = entity
    }
}

extension CategoriesListInteractor: CategoriesListInteractorInput {
    func loaded() {
    }

    func appeared() {
    }
}
