//
//  HomeDatasourse.swift
//  MyTwitter
//
//  Created by 123 on 23.06.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import LBTAComponents

class HomeDatasourse: Datasource {
    let users: [User] = {
        let tarasUser = User(name: "Taras Iarmoliuk", username: "@iarmoliuktaras", bioText: "Dope Developer", profileImage: #imageLiteral(resourceName: "userImage"))
        
        let driplla = User(name: "Vlad Ishenko", username: "@driplla", bioText: "Best DJ", profileImage: #imageLiteral(resourceName: "userImage"))
        return [tarasUser, driplla]
    }()
    
    //let words = ["user", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
