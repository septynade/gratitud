//
//  Zen.swift
//  hamdalah
//
//  Created by midn1ght on 1/18/21.
//

import Foundation

struct Zen: Codable {
    let a: String
    let q: String
    
    enum CodingKeys: String, CodingKey {
        case a
        case q
    }
}
