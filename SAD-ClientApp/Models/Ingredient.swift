//
//  Ingredient.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 20/08/22.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    let id: UUID?
    var name: String
    var producer: String
}
