//
//  Coordinator.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 30/10/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set }
    
    func start()
}
