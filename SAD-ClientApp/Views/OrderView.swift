//
//  OrderView.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 08/09/22.
//

import Foundation
import SwiftUI

struct OrderView: View {
    
    
    
    var body: some View {
        //        Text("Hello")
        NavigationView {
            VStack{
                
                List(order.drink, id: \.id){ drink in
                    HStack{
                        Text(drink.name)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                        Text("\(String(format: "%.2f", drink.price))  $")
                    }
                }
                .navigationTitle(Text("Order"))
                            Text(order.state)
            }
        }
        //        .onAppear {
        //                Task {
        //                    do {
        //                        try await drinkListViewModel.fetchDrinks()
        //                    } catch {
        //                        print("Error: \(error)")
        //                    }
        //                }
        //            }
        
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
