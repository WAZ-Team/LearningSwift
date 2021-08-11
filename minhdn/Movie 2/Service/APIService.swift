//
//  APIService.swift
//  Movie 2
//
//  Created by MinhDev on 8/4/21.
//

import Foundation
class Service {
    
    static let shared = Service()


    func getMoviedata(closure: @escaping (_ response: [Favorite]?, _ error: Error?) -> Void) {
        guard let path = Bundle.main.path(forResource: "Movie", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do{
            var listdata: [Favorite] = [Favorite]()
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data , options: .mutableContainers)
            if  let array = json as? [[String:Any]] {
                for item in array{
                    var itemposts: Favorite = Favorite ()
                    itemposts = itemposts.initLoad(item)
                    listdata.append(itemposts)
                }
                closure(listdata,nil)
            }
            
        }
        catch{
            print(error)
        }
        closure(nil,nil)
    }
}
