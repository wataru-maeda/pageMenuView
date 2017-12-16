//
//  ChildViewController.swift
//  try_page_menu_2
//
//  Created by Wataru Maeda on 2017/12/15.
//  Copyright © 2017 com.watarumaeda. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 24)
    label.textAlignment = .center
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    titleLabel.text = title
    view.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
  }
}
