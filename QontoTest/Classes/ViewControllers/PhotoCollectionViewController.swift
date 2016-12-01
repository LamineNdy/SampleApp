//
//  PhotoCollectionViewController.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "PhotoCellReuseId"

class PhotoCollectionViewController: UICollectionViewController {
  
  var photos: [Photo]?
  var albumId:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
      WebService.fetchPhotos(albumId!) {(photos, error) -> () in
        if error == nil {
          DispatchQueue.main.async {
            self.photos = photos
            self.collectionView?.reloadData()
          }
        } else {
          print(error!)
        }
      }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
     return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      guard let photos = photos else {
        return 0
      }
      return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let photo = photos?[indexPath.row] else {
        return UICollectionViewCell()
      }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let imageView = UIImageView()
        imageView.sd_setImage(with: NSURL(string: photo.thumbnailUrl ?? "") as! URL)
        cell.backgroundView = imageView
        return cell
    }

}
