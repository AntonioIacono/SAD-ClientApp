//
//  IngredientListView.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 20/08/22.
//

import Foundation
import SwiftUI

struct IngredientList: View {
    
    @StateObject var viewModel = IngredientListViewModel()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.ingredients) {
                    ingredient in
                    Button {
                        print("selected")
                    } label: {
                        Text(ingredient.name)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("Ingredients"))
            
        }.onAppear {
            Task {
                do {
                    try await viewModel.fetchIngredients()
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
