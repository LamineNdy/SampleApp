//
//  Photo.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit

class Photo: NSObject {

  var albumId: Int?
  var photoId: Int?
  var title: String?
  var thumbnailUrl: String?
  
  
  init(albumId: Int, photoId: Int?, title: String?, thumbnailUrl: String?) {
    self.albumId = albumId
    self.photoId = photoId
    self.title = title
    self.thumbnailUrl = thumbnailUrl
  }
  
}
