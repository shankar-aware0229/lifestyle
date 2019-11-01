//
//  CategoriesDetailView.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Arrk Group. All rights reserved.
//

import UIKit

extension CategoriesDetailAssembler {
    func assemble(with wireframe: CategoriesDetailWireframe) -> CategoriesDetailUI {
        return assemble(with: wireframe, viewType: CategoriesDetailView.self)
    }
}

class CategoriesDetailView: UIViewController {
    private let user: CategoriesDetailUser
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    required init(_ user: CategoriesDetailUser) {
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

extension CategoriesDetailView: CategoriesDetailUI {
    func finished(with viewModel: CategoriesDetailViewModel) {

    }
}
