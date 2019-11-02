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
        colorLabel.text = "COLOR: \(varient.color ?? "")"
        sizeLabel.text = "SIZE: \(varient.size ?? 0)"
        prizeLabel.text = "PRIZE: \(varient.price ?? 0)"
    }
}
