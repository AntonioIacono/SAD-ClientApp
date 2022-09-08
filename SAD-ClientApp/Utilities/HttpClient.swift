//
//  HttpClient.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 20/08/22.
//

import Foundation


enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}

class HttpClient {
    private init() { }
    
    static let shared = HttpClient()
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw HttpError.errorDecodingData
        }
        return object
    }
}
//MI SERVE UNA FUNZIONE CHE PRIMA FA UNA POST PER CREARE L'ORDINE
//POI FA UNA PUT PER AGGIUNGERE I DRINK
