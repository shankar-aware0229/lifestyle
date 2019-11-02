//
//  String.swift
//  Lifestyle
//
//  Created by SAGAR THAKARE on 02/11/19.
//  Copyright © 2019 Shankar Aware. All rights reserved.
//

import Foundation

extension String {
    var local: String {
        return NSLocalizedString(self, comment: "")
    }
}
