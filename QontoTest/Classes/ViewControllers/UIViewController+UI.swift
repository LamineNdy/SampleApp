//
//  UITableViewControlelr+AlertView.swift
//  QontoTest
//
//  Created by Lamine NDIAYE on 01/12/2016.
//  Copyright © 2016 Lamine. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  
  func showAlert(title: String?, message: String?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
      self.dismiss(animated: true, completion: nil)
    }
    alertController.addAction(OKAction)
    
    self.present(alertController, animated: true) {
    }
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
