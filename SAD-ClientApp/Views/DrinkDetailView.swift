//
//  DrinkDetailView.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 24/08/22.
//

import Foundation
import SwiftUI

struct DrinkDetailView: View {
    @StateObject var drinkListViewModel = DrinkListViewModel()
    @StateObject var orderViewModel = OrderViewModel()
    var drink : Drink
    var body: some View {
        VStack(alignment: .center){
            Text(drink.name)
                .fontWeight(.semibold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .font(.title)
            Text(drink.description)
            Text("\(String(format: "%.2f", drink.price))  $")
            IngredientListView(drink: drink )
        }
        Spacer()
        Button {
            orderSend.drink.append(drink)
//            orderViewModel.drinks.append(drink)
//            orderViewModel.addDrink(drink: drink)
            drinkListViewModel.createOrder()
        } label: {
            Text("Add to Order")
                .font(.system(size: 30, weight: .heavy, design: .rounded))
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.height * 0.3, height: UIScreen.main.bounds.height * 0.3 ,alignment: .center )
                .scaledToFit()
        }.onSubmit {
            Task {
                do {
                    try await orderViewModel.addDrink(drink: drink)
                } catch {
                    print("Error: \(error)")
                }
            }
        }
            
        Spacer()
    }
}
struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(drink : DrinkListViewModel().drinks.first!)
    }
}
