//
//  Data.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation

// MARK: - DataModel
struct PryanikiData: Decodable {
    let data: [AnotherData]
    let view: [String]
}

struct AnotherData: Decodable {
    let name: String
    let data: DataClass
}

struct DataClass: Decodable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
}

struct Variant: Decodable {
    let id: Int
    let text: String
}
