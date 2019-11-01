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

    init(entity: CategoriesDetailEntity) {
        self.entity = entity
    }
}

extension CategoriesDetailInteractor: CategoriesDetailInteractorInput {
    func loaded() {
    }

    func appeared() {
    }
}
