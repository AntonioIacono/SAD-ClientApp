//
//  DrinkViewModel.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 24/08/22.
//

import Foundation
import SwiftUI

class DrinkListViewModel: ObservableObject {
    @Published var drinks = [Drink]()
    @Published var billCreated = Bool()
    @Published var orderCreated = Bool()
    @Published var bill = Bill(id: nil, table: 30, state: "Bill Opened", date: Date.now, total: 20)
    
   // @Published var shared = DrinkListViewModel()
    
    
    func createOrder(){
        self.orderCreated = true
    }
    
//    func deleteOrder(){
//        self.orderCreated = false
//        self.drinks.removeAll()
//    }
    
    func fetchDrinks() async throws {
        let urlString = Constants.baseURL + Endpoints.drinks
    
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let drinkResponse: [Drink] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.drinks = drinkResponse
        }
    }
    
    func createBill() async throws {
        let urlString = Constants.baseURL + Endpoints.bills
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        let billToCreate = Bill(id: UUID(), table: 30, state: "Bill Opened", date: Date.now, total: 20)
//        let billToCreate = BillToBeCreated( table: 30, state: "Bill Opened", date: Date.now, total: 20)
//        let songToUpdate = Song(id: songID, title: songTitle)
        let BillCreated = try await HttpClient.shared.sendData(to: url, object: billToCreate, httpMethod: HttpMethods.POST.rawValue)
        
        DispatchQueue.main.async {
            self.bill = BillCreated
        }
    }
    
//    func confirmOrder() async throws {
//        let urlString = Constants.baseURL + Endpoints.orders
//        guard let url = URL(string: urlString) else {
//            throw HttpError.badURL
//        }
//
//        let urlString = Constants.baseURL + Endpoints.orders
//        guard let url = URL(string: urlString) else {
//            throw HttpError.badURL
//        }
//
//        let orderToCreate = Order(id: UUID(), table: 30, state: "Bill Opened", date: Date.now, total: 20)
////        let billToCreate = BillToBeCreated( table: 30, state: "Bill Opened", date: Date.now, total: 20)
////        let songToUpdate = Song(id: songID, title: songTitle)
//        let BillCreated = try await HttpClient.shared.sendData(to: url, object: billToCreate, httpMethod: HttpMethods.POST.rawValue)
//
//        DispatchQueue.main.async {
//            self.bill = BillCreated
//        }
//
//    }
    
    
    
    //funzione per la creazione del conto func createBill()
//
//    func createBill (bill:Bill){
//        let urlString = Constants.baseURL + Endpoints.drinks
//
//        guard let url = URL(string: urlString) else {
//            throw HttpError.badURL
//        }
//    }
    
    //funzione per la chiusura del conto func closeBill()
    //utilizza sempre sendData(da HttpClient) ma serve ad aggiornare (PUT)
    // lo stato dell'ordine
    
}
