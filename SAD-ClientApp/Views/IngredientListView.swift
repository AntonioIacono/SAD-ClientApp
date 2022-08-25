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
    @State var modal: ModalType? = nil
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
            .toolbar{
                Button{
            print("add ingredient")
                } label: {
                Label("Add ingredient", systemImage: "plus.circle"  )
                }
            }
            
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

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
