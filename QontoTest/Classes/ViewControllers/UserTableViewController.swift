//
//  UserTableViewController.swift
//  QontoTest
//
//  Created by Lamine Ndiaye on 30/11/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import UIKit
private let userCellId = "DefaultCelll"
private let albumSegueId = "album"

class UserTableViewController: UITableViewController {
  
  var users :[User]?
  var selectedRow: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "users"
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
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let users = users else {
      return 0
    }
    return users.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let user = users?[indexPath.row] else {
      return UITableViewCell()
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: userCellId, for: indexPath)
    cell.textLabel?.text = user.name
    cell.detailTextLabel?.text = user.userName
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let user = users?[indexPath.row] else {
      return
    }
    selectedRow = user.userId!
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == albumSegueId {
      let vc = segue.destination as? AlbumTableViewController
      if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
        let user = self.users?[indexPath.row]
        vc?.user = user
      }
    }
  }
  
  func triggerFetch() {
    self.addIndicator()
    self.refreshControl?.beginRefreshing()
    WebService.fetchUsers { (users, error) in
      if error == nil {
        DispatchQueue.main.async {
          self.users = users
        }
        User.removeAllUsers()
        User.saveUsers(users)
      } else {
        print(error!)
        self.users = User.storedUsers()
        DispatchQueue.main.async {
          self.showAlert(title: "Error", message: "An error occured,")
          print(error!)
        }
      }
      DispatchQueue.main.async {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        self.removeIndicator()
      }
    }
  }
  
}
