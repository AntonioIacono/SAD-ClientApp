//
//  IngredientListViewModel.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 20/08/22.
//

import Foundation
import SwiftUI

class IngredientListViewModel: ObservableObject {
    @Published var ingredients = [Ingredient]()
    
    func fetchIngredients() async throws {
        let urlString = Constants.baseURL + Endpoints.ingredients
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let ingredientResponse: [Ingredient] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.ingredients = ingredientResponse
        }
    }
}
