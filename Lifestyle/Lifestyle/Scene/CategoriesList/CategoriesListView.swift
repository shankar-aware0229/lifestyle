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

struct CategoryCellIdentifier {
    static let CategoryCell = "CategoryCell"
}

class CategoriesListView: UIViewController {
    private let user: CategoriesListUser
    private var categories = [Categories]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    required init(_ user: CategoriesListUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         collectionView.register(UINib(nibName: CategoryCellIdentifier.CategoryCell, bundle: nil),forCellWithReuseIdentifier: CategoryCellIdentifier.CategoryCell)
        self.title = "Lifestyle"
        user.loaded()
    }

    @IBAction func buttonAction(_ sender: UIButton) {
       
    }
}

extension CategoriesListView: CategoriesListUI {
    func showResult(_ categoriesList: [Categories]) {
        categories = categoriesList
        collectionView.reloadData()
    }
}


extension CategoriesListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCellIdentifier.CategoryCell, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(for: categories[indexPath.row], and: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //presenter.collectionViewDidSelectMovieAt(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (self.collectionView.frame.height * 0.3)
        let width: CGFloat = (self.collectionView.frame.width / 3) - 2
        return CGSize(width: ceil(width), height: ceil(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 2 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 2 }
}

