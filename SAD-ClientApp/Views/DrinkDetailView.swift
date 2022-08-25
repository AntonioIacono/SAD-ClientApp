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
            Text("Title")
                .fontWeight(.semibold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .font(.title)
            Text("description")
            Text("price")
            
        }
    }
}
struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(drink : DrinkListViewModel().drinks.first!)
    }
}
