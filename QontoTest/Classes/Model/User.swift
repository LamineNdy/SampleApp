//
//  User.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit

class User: NSObject {
  
  var userId: Int?
  var name: String?
  var userName: String?
  
  init(userId: Int, name: String?, userName: String?) {
    self.userId = userId
    self.name = name
    self.userName = userName
  }
}
