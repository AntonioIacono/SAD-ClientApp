//
//  Order.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 12/10/22.
//

import Foundation
struct  Order: Identifiable, Codable {
    
    var id : UUID? // per farlo poi salvare da fluent sul db e non crearlo da codice
//    var id = UUID()
    var state: String
//    var drink: [Drink] = []
    var total: Double
}
