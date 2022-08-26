//
//  Data.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation

// MARK: - Networking Data Model
struct PryanikiData: Decodable {
    let data: [AnotherData]
    let view: [Names]
}

struct AnotherData: Decodable {
    let name: Names
    let data: DataClass
}

enum Names: String, Decodable {
    case hz, picture, selector
}

struct DataClass: Decodable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Decodable {
    let id: Int
    let text: String
}
