//
//  CategoriesDetailInteractor.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import Foundation

class CategoriesDetailInteractor {
    weak var output: CategoriesDetailInteractorOutput?
    private let entity: CategoriesDetailEntity

    //Injecting Dependencies
    init(entity: CategoriesDetailEntity) {
        self.entity = entity
    }
}

extension CategoriesDetailInteractor: CategoriesDetailInteractorInput {
    func loaded() {
        let category = entity.category
        output?.showSubCategoriesInfo(category)
    }

    func appeared() {
    }
}
