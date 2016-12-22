//
//  Photo.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
import SwiftyJSON

final class Photo: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable {

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
  
  override init() {
    
  }
  
  //Mark:- ResponseObjectSerializable, ResponseCollectionSerializable methods
  required convenience init?(response: HTTPURLResponse, representation: AnyObject) {
    self.init()
    self.populateFromResult(representation)
  }
  
  static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Photo] {
    var photos = [Photo]()
    if let jsonValues = representation as? [[String: AnyObject]] {
      for storeRepresentation in jsonValues {
        if let photo = Photo(response: response, representation: storeRepresentation as AnyObject) {
          photos.append(photo)
        }
      }
    }
    return photos
  }
  
  func populateFromResult(_ representation: AnyObject?) {
    if let jsonRepresentation = representation {
      let json = JSON(jsonRepresentation)
      albumId = json["albumId"].intValue
      photoId = json["id"].intValue
      title = json["title"].stringValue
      thumbnailUrl = json["thumbnailUrl"].stringValue
    }
  }
  
}
