//
//  MovieData.swift
//  Movie 2
//
//  Created by MinhDev on 7/12/21.
//



import Foundation

class APIService {
private init() {}
    static func load<T:Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)

        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

    
