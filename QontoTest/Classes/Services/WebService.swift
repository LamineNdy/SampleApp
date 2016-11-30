//
//  WebService.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
import Alamofire


private let kRequestTimout: TimeInterval = 60
let kBaseUrl = "https://jsonplaceholder.typicode.com/"
// https://jsonplaceholder.typicode.com/users
//https://jsonplaceholder.typicode.com/users/{user_id}/albums
// https://jsonplaceholder.typicode.com/albums/{album_id}/photos
let kuserApi = "users"
let kAlbumApi = "albums"
let kPhotoApi = "Photo"




class WebService: NSObject {
  
  enum Router: URLRequestConvertible {
    
    case fetchUser()
    case fetchUserAlbum(Int)
    case fetchAlbumPhotos(Int)
    
//    var headers: [String: String] {
//      return ["contentType":"application/json; charset=UTF-8"]
//    }
    
    public func asURLRequest() throws -> URLRequest {
      let path: String = {
        switch self {
        case .fetchUser():
          return kuserApi
        case .fetchUserAlbum(let userId):
          return "\(kuserApi)/\(userId)/\(kAlbumApi)"
        case .fetchAlbumPhotos(let albumId):
          return  "\(kAlbumApi)/\(albumId)/\(kPhotoApi)"
        }
      }()
      let url = kBaseUrl + path //try kBaseUrl.asURL()
      let urlRequest = URLRequest(url: URL(string: url)!)
      return urlRequest
    }
  }
  
  static func fetchUsers (_ completion: @escaping (_ users: [User], _ error: NSError?) -> ())  {
    Alamofire.request(Router.fetchUser()).responseCollection { (response: DataResponse<[User]>)  in
      switch response.result
      {
      case .success(let users):
        completion(users, nil)
        
      case .failure(let error):
        completion([User](), error as NSError?)
      }
    }
  }
  
  static func fetchAlbums (_ userId: Int, _ completion: @escaping (_ albums: [Album], _ error: NSError?) -> ())  {
    Alamofire.request(Router.fetchUserAlbum(userId)).responseCollection { (response: DataResponse<[Album]>)  in
      switch response.result
      {
      case .success(let albums):
        completion(albums, nil)
        
      case .failure(let error):
        completion([Album](), error as NSError?)
      }
    }
  }


}
