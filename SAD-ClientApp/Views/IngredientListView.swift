//
//  IngredientListView.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 20/08/22.
//

import Foundation
import SwiftUI

struct IngredientListView: View {
    
    @StateObject var ingredientViewModel = IngredientListViewModel()
    @State var modal: ModalType? = nil
    var drink: Drink
    var body: some View {
        NavigationView {
            List {
                ForEach(ingredientViewModel.ingredients) {
                    ingredient in
                  
                        Text(ingredient.name)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                }
            }.navigationTitle(Text("Ingredients"))
         
            
        }.onAppear {
            Task {
                do {
                    Endpoints.idDrinks = "\(String(describing: drink.id!))"
                    try await ingredientViewModel.fetchIngredients(enpointIdDrink: "\(String(describing: drink.id!))")
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView(drink: DrinkListViewModel().drinks.first!)
    }
}
