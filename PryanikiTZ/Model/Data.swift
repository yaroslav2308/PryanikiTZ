//
//  Data.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation

// MARK: - DataModel
struct Data {
    let data: [AnotherData]
    let view: [String]
}

struct AnotherData {
    let name: String
    let data: DataClass
}

struct DataClass {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
}

struct Variant {
    let id: Int
    let text: String
}
