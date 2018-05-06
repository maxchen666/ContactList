//
//  Contact_ListTests.swift
//  Contact ListTests
//
//  Created by chen yong on 5/5/18.
//  Copyright © 2018 Max Chen. All rights reserved.
//

import XCTest
@testable import Contact_List

class Contact_ListTests: XCTestCase {
    var contactService: ContactService!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        contactService = ContactService()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        contactService = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        contactService.LoadContacts(){
            contacts in
            
            XCTAssertFalse(contacts.count > 0)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
