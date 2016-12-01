//
//  AlbumTableViewController.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit

private let albumCellId = "albumCellReuseIdentifier"
private let photoSegue = "photos"


class AlbumTableViewController: UITableViewController {
  
  var albums: [Album]?
  var user: User?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = user?.userName
    self.refreshControl = UIRefreshControl()
    self.refreshControl?.addTarget(self, action: #selector(triggerFetch), for: UIControlEvents.valueChanged)
    triggerFetch()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let albums = albums else {
      return 0
    }
    return albums.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let album = albums?[indexPath.row] else {
      return UITableViewCell()
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath)
    cell.textLabel?.text = album.title
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == photoSegue {
      let vc = segue.destination as? PhotoCollectionViewController
      if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
        let album = self.albums?[indexPath.row]
        vc?.album = album
      }
    }
  }
  
  func triggerFetch () {
    self.refreshControl?.beginRefreshing()
    self.addIndicator()
    WebService.fetchAlbums((user?.userId)!) { (albums, error) -> () in
      if error == nil {
        DispatchQueue.main.async {
          self.albums = albums
        }
      } else {
        DispatchQueue.main.async {
          self.showAlert(message: "Error")
          self.refreshControl?.endRefreshing()
          print(error!)
        }
      }
      DispatchQueue.main.async {
        self.removeIndicator()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
      }
    }
  }
}
