//
//  CategoriesDetailProtocols.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import UIKit

protocol CategoriesDetailWireframe: class {
    
}

protocol CategoriesDetailUser: class {
    func loaded()
    func appeared()
}

protocol CategoriesDetailInteractorInput: class {
    func loaded()
    func appeared()
}

protocol CategoriesDetailInteractorOutput: class {
   
}

protocol CategoriesDetailUI: class {
    init(_ presenter: CategoriesDetailUser)
    var viewController: UIViewController { get }
    func finished(with viewModel: CategoriesDetailViewModel)
}

extension CategoriesDetailUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
