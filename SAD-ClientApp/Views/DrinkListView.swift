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
//    @State var billCreated: Bool = false
//    @State var orderCreated: Bool = false
    
    var body: some View {
//        VStack{
        NavigationView {
            VStack{
                HStack{
                    if(!drinkListViewModel.billCreated){
                    Button {
                        drinkListViewModel.billCreated=true
                        Task {
                            do {
                                try await drinkListViewModel.createBill()
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                        
                    } label: {
                        
                        Text("New Bill")
                            .font(.system(size: UIScreen.main.bounds.width*0.04, weight: .heavy, design: .rounded))
                            .padding(.all)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(20)
                            .scaledToFit()
                        }
                    }else{
                       
                            
                                Text("Bill Created")
                                    .font(.system(size: UIScreen.main.bounds.width*0.04, weight: .heavy, design: .rounded))
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(0)
                                    .scaledToFit()
                       
                    }
                    
                    if(!(drinkListViewModel.orderCreated)){
                    Button {
                        drinkListViewModel.createOrder()
                    } label: {
                        Text("New Order")
                            .font(.system(size: UIScreen.main.bounds.width*0.04, weight: .heavy, design: .rounded))
                            .padding(.all)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(20)
                            .scaledToFit()
                        }
                    }else{
                        NavigationLink(destination: OrderView(),label:{
                               Text("Review Order")
                                    .font(.system(size: UIScreen.main.bounds.width*0.04, weight: .heavy, design: .rounded))
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                    .scaledToFit()
                        })
                    }
                    
                }
                List(drinkListViewModel.drinks, id: \.id){ drink in
                    NavigationLink(destination: DrinkDetailView(drink: drink), label: {
                        HStack{
                            Text(drink.name)
                                .font(.title3)
                                .foregroundColor(Color(.label))
                            Text("\(String(format: "%.2f", drink.price))  $")
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
        
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkListView()
    }
}
