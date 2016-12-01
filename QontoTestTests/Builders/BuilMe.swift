//
//  BuilMe.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import Foundation

class BuildMe {
  
  class func aUser() -> UserBuilder {
    return UserBuilder()
  }
  
  class func anAlbum() -> AlbumBuilder {
    return AlbumBuilder()
  }
  
  class func aPhoto() ->  PhotoBuilder{
    return PhotoBuilder()
  }
  
}
