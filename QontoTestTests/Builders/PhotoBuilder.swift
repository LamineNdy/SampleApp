//
//  PhotoBuilder.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit

class PhotoBuilder: NSObject {
  
  private var albumId: Int = 0
  private var photoId: Int = 0
  private var title : String = ""
  
  func build() -> Photo {
    
    let photo = Photo()
    photo.title = title
    photo.photoId = photoId
    photo.albumId = albumId
    return photo
  }
  
  func initWith(photoId: Int, title :String, albumId: Int) -> PhotoBuilder {
    self.photoId = photoId
    self.title = title
    self.albumId = albumId
    return self
  }

}
