//
//  Service.swift
//  MyTwitter
//
//  Created by 123 on 10.07.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ())  {
        print("Fetching home feed")
        
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfuly fetched our JSON objects")
            print(homeDatasource.users.count)
            
            completion(homeDatasource)
//            self.datasource = homeDatasource
        }) { (error) in
            print("Failed to fetch Json...", error)
        }
        
        print(123)
        
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
