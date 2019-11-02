//
//  SectionHeaderView.swift
//  Lifestyle
//
//  Created by SHANKAR AWARE on 02/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    @IBOutlet  weak var categoryTitleLabel: UILabel!
    
    var categoryTitle: String! {
        didSet {
            categoryTitleLabel.text = categoryTitle
        }
    }
}

