//
//  ContactApiResult.swift
//  Contact List
//
//  Created by chen yong on 5/5/18.
//  Copyright © 2018 Max Chen. All rights reserved.
//

import Foundation
import UIKit

struct Contact: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let gender: String
    
    var fullname: String
    var isFavorite: Bool
    
    init?(id: Int)
    {
        self.id = id
        self.first_name = ""
        self.last_name = ""
        self.email = ""
        self.gender = ""
        self.fullname = ""
        self.isFavorite = false
    }
    
    init?(dictionary : [String:Any]) {
        self.id = dictionary["id"] as? Int ?? 0
        self.first_name = dictionary["first_name"] as? String ?? ""
        self.last_name = dictionary["last_name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.gender = dictionary["gender"] as? String ?? ""
        
        self.fullname = self.first_name + " " + self.last_name
        self.isFavorite = false
    }
    
    init?(data: Data) {
        guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else { return nil }
        self.init(dictionary: json)
    }
    init?(json: String) {
        self.init(data: Data(json.utf8))
    }
}
