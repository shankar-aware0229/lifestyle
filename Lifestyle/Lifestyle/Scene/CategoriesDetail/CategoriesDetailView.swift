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

struct CategoryDetailsCellIdentifier {
    static let CategoryDetailsCell = "CategoryDetailsCell"
    static let SectionHeaderView = "SectionHeaderView"
}

class CategoriesDetailView: UIViewController {
    private let user: CategoriesDetailUser
    private var categories: Categories?

    @IBOutlet weak var collectionView: UICollectionView!

    required init(_ user: CategoriesDetailUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CategoriesDetailView.Title.Text".local.uppercased()
        setupCollectionView()
        user.loaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        user.appeared()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CategoryDetailsCellIdentifier.CategoryDetailsCell, bundle: nil),forCellWithReuseIdentifier: CategoryDetailsCellIdentifier.CategoryDetailsCell)
        collectionView.register(UINib(nibName: CategoryDetailsCellIdentifier.SectionHeaderView, bundle: nil), forCellWithReuseIdentifier: CategoryDetailsCellIdentifier.SectionHeaderView)

    }
}

extension CategoriesDetailView: CategoriesDetailUI {
    func showResult(_ category: Categories) {
        categories = category
        collectionView.reloadData()
    }
}

extension CategoriesDetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories?.products?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.products?[section].variants?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryDetailsCellIdentifier.CategoryDetailsCell, for: indexPath) as? CategoryDetailsCell else {
            return UICollectionViewCell()
        }
        guard let varients = categories?.products?[indexPath.section].variants else { return UICollectionViewCell() }
        cell.configureCell(for: varients[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // user.selectCategory(at: indexPath.row)
    }
    
    //Section  Header
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryDetailsCellIdentifier.SectionHeaderView, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
//        guard let category = categories?.products?[indexPath.section] else { return  UICollectionReusableView() }
//        
//        sectionHeaderView.categoryTitle = category.name
//        
//        return sectionHeaderView
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
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

