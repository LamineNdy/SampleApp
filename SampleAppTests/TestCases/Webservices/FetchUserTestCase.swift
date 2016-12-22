//
//  FetchUserTestCase.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import XCTest

class FetchUserTestCase: QontoTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func test_users_should_be_fetched_succesfully() {
   //Arrange
    setupStub(filename: "users.json",status:SucceedStatus)
    let requestExpectation = expectation(description: "request completion")
    var fetchedUsers: [User]?
   //Act
    
    WebService.fetchUsers { (users, error) in
      fetchedUsers = users
      requestExpectation.fulfill()
    }
   
   //Assert
     waitForExpectations(timeout: RequestTimeout, handler: { error in
      XCTAssertEqual(fetchedUsers?.first?.name, "Leanne Graham", "name shoud be the first item of the json file")
      XCTAssertEqual(fetchedUsers?[4].userId, 5, "id should return the fith item of the json")

     })
   }
  
  func test_users_should_be_fetched_with_invalid_json_then_return_zero_element() {
    //Arrange
    setupStubWithEmptyjson()
    let requestExpectation = expectation(description: "request completion")
    var fetchedUsers: [User]?
    //Act
    
    WebService.fetchUsers { (users, error) in
      fetchedUsers = users
      requestExpectation.fulfill()
    }
    
    //Assert
    waitForExpectations(timeout: RequestTimeout, handler: { error in
      XCTAssertNil(fetchedUsers?.first, "should return nil")
    })
  }
  
  func test_users_should_be_fetched_with_error_then_return_zero_element() {
    //Arrange
    setupStubWithError()
    let requestExpectation = expectation(description: "request completion")
    var fetchedUsers: [User]?
    //Act
    
    WebService.fetchUsers { (users, error) in
      fetchedUsers = users
      requestExpectation.fulfill()
       XCTAssertNotNil(error, "should return an eroor")
    }
    
    //Assert
    waitForExpectations(timeout: RequestTimeout, handler: { error in
      XCTAssertNil(fetchedUsers?.first, "should return nil")
    })
  }
  
  
}
