//
//  CategoriesDetailAssembler.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import Foundation

struct CategoriesDetailAssembler {
    let entity: CategoriesDetailEntity

    func assemble(with wireframe: CategoriesDetailWireframe,
                  viewType: CategoriesDetailUI.Type) -> CategoriesDetailUI {
        let interactor = CategoriesDetailInteractor(entity: entity)
        let presenter = CategoriesDetailPresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
