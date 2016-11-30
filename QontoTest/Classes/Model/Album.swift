//
//  Album.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
import SwiftyJSON

final class Album: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable  {
  
  var userId: Int?
  var albumId: Int?
  var title: String?
  
  init(userId: Int, albumId: Int?, title: String?) {
    self.userId = userId
    self.albumId = albumId
    self.title = title
  }
  
  override init() {
  }
  
  //Mark:- ResponseObjectSerializable, ResponseCollectionSerializable methods
  required convenience init?(response: HTTPURLResponse, representation: AnyObject) {
    self.init()
    self.populateFromResult(representation)
  }
  
  static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Album] {
    var albums = [Album]()
    if let jsonValues = representation as? [[String: AnyObject]] {
      for storeRepresentation in jsonValues {
        if let album = Album(response: response, representation: storeRepresentation as AnyObject) {
          albums.append(album)
        }
      }
    }
    return albums
  }
  
  func populateFromResult(_ representation: AnyObject?) {
    if let jsonRepresentation = representation {
      let json = JSON(jsonRepresentation)
      userId = json["userId"].intValue
      albumId = json["id"].intValue
      title = json["title"].stringValue
    }
  }
}
