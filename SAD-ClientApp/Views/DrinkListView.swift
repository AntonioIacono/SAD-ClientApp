//
//  DrinkView.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 24/08/22.
//

import Foundation
import SwiftUI

struct DrinkListView: View {
    
    @StateObject var drinkListViewModel = DrinkListViewModel()
    @State var modal: ModalType? = nil
    var body: some View {
        NavigationView {
                List(drinkListViewModel.drinks, id: \.id){ drink in
                    NavigationLink(destination: DrinkDetailView(drink: drink), label: {
                  
                        HStack{
                        Text(drink.name)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                        }
                    })
                }
            .navigationTitle(Text("Menu"))
        }.onAppear {
            Task {
                do {
                    try await drinkListViewModel.fetchDrinks()
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkListView()
    }
}
