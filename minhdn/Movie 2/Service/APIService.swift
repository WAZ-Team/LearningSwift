//
//  APIService.swift
//  Movie 2
//
//  Created by MinhDev on 8/4/21.
//

import Foundation
class Service {
    
    static let shared = Service()

func searchMovies(searchTerm: String, completion: @escaping (Result<Search, Error>) -> () ) {
//    let term = searchTerm.replacingOccurrences(of: " ", with: "+")
    let filename = "Movie.json"
    
    fetchGenericData(filename: filename, completion: completion)
}

fileprivate func fetchGenericData<T: Decodable>(filename: String, completion: @escaping (Result<T, Error>) -> ()) {
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            DispatchQueue.main.async {
                completion(.failure(error))
                return
            }
        }
        
        guard let data = data else {
            fatalError("Invalid Data")
        }
        
        do {
            let results = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(.success(results))
            }
        }
        catch let error {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
        
    }.resume()
}
}
