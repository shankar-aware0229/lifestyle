//
//  CategoryDetailsCell.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import UIKit

class CategoryDetailsCell: UICollectionViewCell {
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureCell(for varient: Varients) {
        colorLabel.text = "\("CategoriesDetailView.Color.Name".local.uppercased()): \(varient.color ?? "")"
        sizeLabel.text = "\("CategoriesDetailView.Size.Name".local.uppercased()): \(varient.size ?? 0)"
        prizeLabel.text = "\("CategoriesDetailView.Prize.Name".local.uppercased()): \(varient.price ?? 0)"
    }
}
