//
//  OrderView.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 08/09/22.
//

import Foundation
import SwiftUI

struct OrderView: View {
    
    @StateObject var orderViewModel = OrderViewModel()
    
    var body: some View {
        //        Text("Hello")
        NavigationView {
                        VStack{
                            List(orderSend.drink, id: \.id){ drink in
            
                                HStack{
                                    Text(drink.name)
                                        .font(.title3)
                                        .foregroundColor(Color(.label))
                                    Text("\(String(format: "%.2f", drink.price))  $")
                                }.swipeActions(allowsFullSwipe: false) {
            
                                    Button(role: .destructive) {
                                        print("Deleting ")
                                        
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                }
                            }
            
//            List{
//                ForEach(orderViewModel.orderSend.drink) { drink in
//                    if #available(iOS 15.0, *) {
//                        HStack{
//                            Text(drink.name)
//                                .font(.title3)
//                                .foregroundColor(Color(.label))
//                            Text("\(String(format: "%.2f", drink.price))  $")
//                        }.swipeActions(allowsFullSwipe: false) {
//
//                            Button(role: .destructive) {
//                                print("Deleting Drink")
//                            } label: {
//                                Label("Delete", systemImage: "trash.fill")
//                            }
//                        }
//                    } else {
//                        // Fallback on earlier versions
//                    }
//                }
                
                Button {
                } label: {
                    Text("Confirm Order")
                        .font(.system(size: UIScreen.main.bounds.width*0.04, weight: .heavy, design: .rounded))
                        .padding(.all)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                        .scaledToFit()
                }
                .navigationTitle(Text("Order Review"))
    
                Text(orderSend.state)
            }
        }
//        .onAppear {
//            Task {
//                do {
//                    try await orderViewModel.fetchDrinks()
//                } catch {
//                    print("Error: \(error)")
//                }
//            }
//        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
