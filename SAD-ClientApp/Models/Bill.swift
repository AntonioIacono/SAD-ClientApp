//
//  Bill.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 07/10/22.
//

import Foundation

struct Bill: Identifiable, Codable {
    let id: UUID?
    var table: Int
    var state: String
    var date : Date
    var total : Double
}

struct BillToBeCreated:  Codable {
    var table: Int
    var state: String
    var date : Date
    var total : Double
}
