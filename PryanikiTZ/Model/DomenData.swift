//
//  DomenModel.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 26.08.2022.
//

import Foundation

// MARK: - Domen Data Model
struct DomenData {
    let type: Names
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}
