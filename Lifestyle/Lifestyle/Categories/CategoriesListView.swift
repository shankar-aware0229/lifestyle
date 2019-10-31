//
//  CategoriesListView.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 31/10/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import UIKit

extension CategoriesListAssembler {
    func assemble(with wireframe: CategoriesListWireframe) -> CategoriesListUI {
        return assemble(with: wireframe, viewType: CategoriesListView.self)
    }
}

class CategoriesListView: UIViewController {
    private let user: CategoriesListUser
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    required init(_ user: CategoriesListUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.loaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        user.appeared()
    }

    @IBAction func buttonAction(_ sender: UIButton) {
       
    }
}

extension CategoriesListView: CategoriesListUI {
    func finished(with viewModel: CategoriesListViewModel) {

    }
}
