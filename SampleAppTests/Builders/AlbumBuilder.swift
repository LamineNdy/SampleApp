//
//  AlbumBuilder.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
@testable import SampleApp

class AlbumBuilder: NSObject {
  private var title :String = ""
  private var albumId :Int = 0
  private var userId:Int = 0
  
  func build() -> Album {
    
    let album = Album()
    album.albumId = albumId
    album.title = title
    album.userId = userId
    return album
  }
  
  func initwith(title: String, userId: Int, albumId: Int) -> AlbumBuilder {
    self.title = title
    self.userId = userId
    self.albumId = albumId
    return self
  }

}
