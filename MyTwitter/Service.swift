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
    
    
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ())  {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print(homeDatasource.users.count)
            
            completion(homeDatasource, nil)
            
        }) { (error) in
            completion(nil, error)
            print("Failed to fetch Json...", error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
