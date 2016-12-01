//
//  UITableViewControlelr+AlertView.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import Foundation
import UIKit
import TSMessages

extension UIViewController {
  
  func showAlert(message: String?) {
    TSMessage.showNotification(withTitle: message, type:.error)
  }
  
  func addIndicator() {
    let blueIndicator = UIActivityIndicatorView()
    blueIndicator.color = UIColor.black
    blueIndicator.startAnimating()
    let activityBarButton = UIBarButtonItem(customView: blueIndicator)
    navigationItem.setRightBarButton(activityBarButton, animated: true)
  }
  
  func removeIndicator() {
    navigationItem.setRightBarButton(nil, animated: true)
  }
  
}
