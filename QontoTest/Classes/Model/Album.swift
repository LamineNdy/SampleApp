//
//  Album.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit

class Album: NSObject {
  
  var userId: Int?
  var albumId: Int?
  var title: String?
  
  init(userId: Int, albumId: Int?, title: String?) {
    self.userId = userId
    self.albumId = albumId
    self.title = title
  }
  
}
