//
//  Order.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 08/09/22.
//

import Foundation

struct  OrderSend: Identifiable, Codable {
    
    var id : UUID? // per farlo poi salvare da fluent sul db e non crearlo da codice
//    var id = UUID()
    var state: String
    var drink: [Drink] = []
    var total: Double
}


var orderSend = OrderSend(state: "not confirmed", total: 10.0)

