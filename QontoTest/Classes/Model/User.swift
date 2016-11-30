//
//  User.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
import SwiftyJSON

final class User: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable {
  
  var userId: Int?
  var name: String?
  var userName: String?
  
  init(userId: Int, name: String?, userName: String?) {
    self.userId = userId
    self.name = name
    self.userName = userName
  }
  
  override init() {
  }
  
  //Mark:- ResponseObjectSerializable, ResponseCollectionSerializable methods
  required convenience init?(response: HTTPURLResponse, representation: AnyObject) {
    self.init()
    self.populateFromResult(representation)
  }
  
  static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [User] {
    var users = [User]()
    if let jsonValues = representation as? [[String: AnyObject]] {
      for storeRepresentation in jsonValues {
        if let user = User(response: response, representation: storeRepresentation as AnyObject) {
            users.append(user)
        }
      }
    }
    return users
  }
  
  func populateFromResult(_ representation: AnyObject?) {
    if let jsonRepresentation = representation {
      let json = JSON(jsonRepresentation)
      userId = json["id"].intValue
      name = json["name"].stringValue
      userName = json["userName"].stringValue
    }
  }
  
}
