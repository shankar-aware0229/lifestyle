//
//  CategoriesListAssembler.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import Foundation

struct CategoriesListAssembler {
    let entity: CategoriesListEntity

    func assemble(with wireframe: CategoriesListWireframe,
                  viewType: CategoriesListUI.Type) -> CategoriesListUI {
        let interactor = CategoriesListInteractor(entity: entity)
        let presenter = CategoriesListPresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
