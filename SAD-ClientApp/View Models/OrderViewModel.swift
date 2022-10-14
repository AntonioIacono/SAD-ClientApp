//
//  OrderViewModel.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 08/09/22.
//

import Foundation
import SwiftUI
class OrderViewModel: ObservableObject {
   // @Published var drinks = [Drink]()
    
    @Published var orderSend = OrderSend(state: "not confirmed yet", total: 0.0)
    
    
    func delete(at offsets: IndexSet) {
        offsets.forEach { i in
            guard let drinkID = orderSend.drink[i].id else {
                return
            }
            orderSend.drink.remove(atOffsets: offsets)
        }
    }
    
    func addDrink(drink:Drink){
        var tmp = orderSend.drink
        tmp.append(drink)
//        DispatchQueue.main.async {
        self.orderSend.drink = tmp
//        }
    }
    
}
