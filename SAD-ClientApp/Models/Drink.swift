//
//  Drink.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 24/08/22.
//

import Foundation
struct Drink: Identifiable, Codable {
    let id: UUID?
    var name: String
    var description: String
    var price: Double
    var availability: Bool
}
