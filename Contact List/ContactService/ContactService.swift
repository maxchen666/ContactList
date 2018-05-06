//
//  ContactService.swift
//  Contact List
//
//  Created by chen yong on 5/5/18.
//  Copyright © 2018 Max Chen. All rights reserved.
//

import Foundation

class ContactService {
    //let contactUrl = "https://gist.githubusercontent.com/pokeytc/e8c52af014cf80bc1b217103bbe7e9e4/raw/4bc01478836ad7f1fb840f5e5a3c24ea654422f7/contacts.json"
    let contactUrl = "https://pastebin.com/raw/waSwQRXF"
    let urlSession:URLSession = URLSession.shared
    
    func LoadContacts( completion: @escaping ([Contact]) -> Void)
    {
        guard let endpoint = URL(string: contactUrl) else {
            print("Error creating endpoint")
            return
        }
        URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            do {
                guard let data = data else {
                    print("no data")
                    return
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] else {
                    print("json failed")
                    return
                }
                var contacts: [Contact] = []
                for case let item in json {
                    let contact = Contact(dictionary: item)
                    contacts.append(contact!)
                }
                
                print(json)
                completion(contacts)
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }.resume()
    }
}
