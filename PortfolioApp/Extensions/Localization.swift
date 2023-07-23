//
//  Localization.swift
//  PortfolioApp
//
//  Created by PC-587 on 23.07.2023.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: "Texts", comment: "")
    }
}
