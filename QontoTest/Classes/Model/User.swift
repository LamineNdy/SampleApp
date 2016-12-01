//
//  User.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
import SwiftyJSON

private let idKey = "id"
private let nameKey = "name"
private let userNameKey = "username"

final class User: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable, NSCoding {
  
  var userId: Int?
  var name: String?
  var userName: String?
  
  init(userId: Int, name: String?) {
    self.userId = userId
    self.name = name
    self.userName = ""
  }
  
  override init() {
  }
  
  //MARK:- ResponseObjectSerializable, ResponseCollectionSerializable methods
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
      userId = json[idKey].intValue
      name = json[nameKey].stringValue
      userName = json[userNameKey].stringValue
    }
  }
  
  required convenience public init?(coder aDecoder: NSCoder) {
    guard let decodedUserId = aDecoder.decodeObject(forKey: "userId") as? Int,
      let decodedName = aDecoder.decodeObject(forKey: nameKey) as? String
      else {
        return nil
    }
    self.init(userId: decodedUserId, name: decodedName)
     self.userName = aDecoder.decodeObject(forKey: userNameKey) as? String
  }
  
  public func encode(with aCoder: NSCoder) {
    aCoder.encode(self.userId, forKey: "userId")
    aCoder.encode(self.name, forKey: nameKey)
    aCoder.encode(self.userName, forKey: idKey)

  }
  
}
