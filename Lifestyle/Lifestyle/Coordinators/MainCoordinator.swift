//
//  MainCoordinator.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /* Entry point for the first VIPER Stack launch */
    func start() {
        let entity = CategoriesListEntity(herokuUrl: URLBuilder.herokuURL)
        let categoriesVC = CategoriesListAssembler(entity: entity)
            .assemble(with: self)
            .viewController
        
        navigationController.pushViewController(categoriesVC, animated: false)
    }
}

extension MainCoordinator: CategoriesListWireframe {
    
}
