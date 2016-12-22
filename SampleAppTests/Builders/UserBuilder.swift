//
//  UserBuilder.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
@testable import SampleApp

class UserBuilder: NSObject {
  
  private var name : String = ""
  private var userID: Int = 0
  private var userName: String = ""
  
  func build() -> User {
    
    let user = User()
    user.name = name
    user.userName = userName
    user.userId = userID
    return user
  }
  
  func initWithName(name :String, userId: Int, userName: String) -> UserBuilder {
    self.name = name
    return self
  }
}
