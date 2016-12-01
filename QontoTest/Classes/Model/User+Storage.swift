//
//  User+Storage.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import Foundation

let kUserDefaultkey = "UsersKey"

extension User {
  
  class func storedUsers() -> [User]? {
    if let data = UserDefaults.standard.object(forKey: kUserDefaultkey) as? Data {
      return NSKeyedUnarchiver.unarchiveObject(with: data) as? [User]
    }
    return nil
  }
  
  
  class func saveUsers(_ fetchedUsers: [User]) {
    for user in fetchedUsers {
      if var users = self.storedUsers() as [User]? {
        users.append(user)
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: users)
        UserDefaults.standard.set(archivedData, forKey: kUserDefaultkey)
      }
      else {
        var users = [User]()
        users.append(user)
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: users)
        UserDefaults.standard.set(archivedData, forKey: kUserDefaultkey)
      }
    }
     UserDefaults.standard.synchronize()
  }
  
  
  class func removeAllUsers() {
    UserDefaults.standard.removeObject(forKey: kUserDefaultkey)
    UserDefaults.standard.synchronize()
  }
  

}
