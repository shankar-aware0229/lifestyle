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
    func appeared()
}

protocol CategoriesListInteractorInput: class {
    func loaded()
    func appeared()
}

protocol CategoriesListInteractorOutput: class {
   
}

protocol CategoriesListUI: class {
    init(_ presenter: CategoriesListUser)
    var viewController: UIViewController { get }
    func finished(with viewModel: CategoriesListViewModel)
}

extension CategoriesListUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
