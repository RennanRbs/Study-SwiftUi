//
//  Food.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import Foundation

struct Food: Codable, Identifiable {
    var id:UUID? = UUID()
    var image: String
}
