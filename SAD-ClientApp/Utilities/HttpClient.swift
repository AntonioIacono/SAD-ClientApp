//
//  HttpClient.swift
//  SAD-ClientApp
//
//  Created by Antonio Iacono on 20/08/22.
//

import Foundation

enum HttpMethods: String {
    case POST, GET, PUT, DELETE
}

enum MIMEType: String {
    case JSON = "application/json"
}

enum HttpHeaders: String {
    case contentType = "Content-Type"
}
enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}

class HttpClient {
    private init() { }
    
    static let shared = HttpClient()
    
    //PER LA GET
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
    
    //POST/PUT
    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws -> T {
        var request = URLRequest(url: url)
         request.httpMethod = httpMethod
         request.addValue(MIMEType.JSON.rawValue,forHTTPHeaderField: HttpHeaders.contentType.rawValue)
         request.httpBody = try? JSONEncoder().encode(object)
    
         let (data, response) = try await URLSession.shared.data(for: request)
       
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let responsObj = try? JSONDecoder().decode(T.self, from: data) else {
            throw HttpError.errorDecodingData
        }
        return responsObj
     }
    
    //DELETE
     func delete(at id: UUID, url: URL) async throws {
         var request = URLRequest(url: url)
         request.httpMethod = HttpMethods.DELETE.rawValue
         
         let (_, response) = try await URLSession.shared.data(for: request)
         
         guard (response as? HTTPURLResponse)?.statusCode == 200 else {
             throw HttpError.badResponse
         }
     }
    
    
}
//MI SERVE UNA FUNZIONE CHE PRIMA FA UNA POST PER CREARE L'ORDINE
//POI FA UNA PUT PER AGGIUNGERE I DRINK
