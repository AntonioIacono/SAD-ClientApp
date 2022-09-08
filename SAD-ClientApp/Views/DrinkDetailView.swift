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
    
    var drink : Drink
    var body: some View {
        VStack(alignment: .leading){
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
            order.drink.append(drink)
            print("selected: (\(order)")
        } label: {
            Text("Add to Order")
                .font(.system(size: 30, weight: .heavy, design: .rounded))
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.height * 0.3, height: UIScreen.main.bounds.height * 0.3 ,alignment: .center )
                .scaledToFit()
        }
            
        Spacer()
    }
}
struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(drink : DrinkListViewModel().drinks.first!)
    }
}
