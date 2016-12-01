//
//  UserTestCase.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import XCTest
@testable import QontoTest

class UserTestCase: QontoTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
      User.removeAllUsers()
    }
    
    func test_users_should_be_stocked_then_retrieved() {
      //Arrange""
      var usersToStore = [User]()
      let user1 = BuildMe.aUser().initWithName(name: "Jon Doe", userId: 1, userName: "jon").build()
      usersToStore.append(user1)
      let user2 = BuildMe.aUser().initWithName(name: "Michael Doe", userId: 3, userName: "jon").build()
      usersToStore.append(user2)
      let user3 = BuildMe.aUser().initWithName(name: "Tesla Doe", userId: 2, userName: "tes").build()
      usersToStore.append(user3)
      
      //Act
      User.saveUsers(usersToStore)
      let retrievedUsers = User.savedUsers()
      //Assert
      XCTAssertEqual((retrievedUsers?.count)!, usersToStore.count, "retrieved uses should be equal to created users")
      XCTAssertNotEqual(0, retrievedUsers?.count, "retrieved uses should  not be equal to 0")
    }
  
  
  func test_users_should_be_stocked_then_flushed() {
    //Arrange""
    var usersToStore = [User]()
    let user1 = BuildMe.aUser().initWithName(name: "Jon Doe", userId: 1, userName: "jon").build()
    usersToStore.append(user1)
    let user2 = BuildMe.aUser().initWithName(name: "Michael Doe", userId: 3, userName: "jon").build()
    usersToStore.append(user2)
    let user3 = BuildMe.aUser().initWithName(name: "Tesla Doe", userId: 2, userName: "tes").build()
    usersToStore.append(user3)
    
    //Act
    User.saveUsers(usersToStore)
    User.removeAllUsers()
    let retrievedUsers = User.savedUsers()
    //Assert
    XCTAssertNil(retrievedUsers?.count, "retrieved uses should be equal to 0")
  }
}
