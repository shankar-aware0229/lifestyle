//
//  CategoryCell.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        categoryName.text = ""
    }
    
    func configureCell(for category: Categories, and row: Int) {
        let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.orange, UIColor.purple]
        backgroundColor = colors[row % colors.count]

        categoryName.text = category.name
    }
}
