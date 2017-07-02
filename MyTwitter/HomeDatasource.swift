//
//  HomeDatasourse.swift
//  MyTwitter
//
//  Created by 123 on 23.06.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        var users = [User]()
        let array = json["users"].array
        
        for user in array! {
            let name = user["name"].stringValue
            let username = user["username"].stringValue
            let bio = user["bio"].stringValue
            
            let aUser = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(aUser)
        }
        self.users = users
    }
    
    let tweets: [Tweet] = {
        
        let tarasUser = User(name: "Taras Iarmoliuk", username: "@iarmoliuktaras", bioText: "Dope Developer", profileImage: #imageLiteral(resourceName: "userImage"))
        let tweet = Tweet(user: tarasUser, message: "Wello come to episode 9 of twitter series i really need a long text block to render cell dasdasdasdasdasdasdasdasdasdasdasdasdasdasdasda")
        let tweet2 = Tweet(user: tarasUser, message: "Wello come to episode 9 of twitter series i really need a long text block to render cell dasdasdasdasdasdasdasdasdasdasdasdasdasdasdasda")
        return [tweet, tweet2]
    }()
    
    //let words = ["user", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        return users[indexPath.row]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
