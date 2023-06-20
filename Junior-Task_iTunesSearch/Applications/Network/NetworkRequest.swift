//
//  NetworkRequest.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/20/23.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init() {
        
    }
    
    func requestData(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {return}
                completion(.success(data))
            }
        }
        task.resume()
    }
}
