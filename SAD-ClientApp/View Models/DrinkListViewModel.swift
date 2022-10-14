//
//  DrinkViewModel.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 24/08/22.
//

import Foundation
import SwiftUI

class DrinkListViewModel: ObservableObject {
    @Published var drinks = [Drink]()
    @Published var billCreated = Bool()
    @Published var orderCreated = Bool()
    
   // @Published var shared = DrinkListViewModel()
    
    
    func createOrder(){
        self.orderCreated = true
    }
    
    
    func fetchDrinks() async throws {
        let urlString = Constants.baseURL + Endpoints.drinks
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let drinkResponse: [Drink] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.drinks = drinkResponse
        }
    }
}
