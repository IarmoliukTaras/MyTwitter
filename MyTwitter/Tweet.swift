//
//  Tweet.swift
//  MyTwitter
//
//  Created by 123 on 27.06.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
