//
//  CategoriesListProtocols.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import UIKit

protocol CategoriesListWireframe: class {
    
}

protocol CategoriesListUser: class {
    func loaded()
}

protocol CategoriesListInteractorInput: class {
    func loaded()
}

protocol CategoriesListInteractorOutput: class {
    func failed(with: Error)
    func prepare(_ info: LifeStyleModel)
}

protocol CategoriesListUI: class {
    init(_ presenter: CategoriesListUser)
    var viewController: UIViewController { get }
    func showResult(_ categoriesList: [Categories])
}

extension CategoriesListUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
