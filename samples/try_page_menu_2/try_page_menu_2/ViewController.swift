//
//  ViewController.swift
//  try_page_menu_2
//
//  Created by Wataru Maeda on 2017/12/15.
//  Copyright © 2017 com.watarumaeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Init View Contollers
    let viewController1 = UIViewController()
    viewController1.view.backgroundColor = .blue
    viewController1.title = "Child View 1"
    
    let viewController2 = UIViewController()
    viewController2.view.backgroundColor = .green
    viewController2.title = "Child View 2"
    
    let viewController3 = UIViewController()
    viewController3.view.backgroundColor = .yellow
    viewController3.title = "Child View 3"
    
    // Add to array
    let viewControllers = [viewController1, viewController2, viewController3]
    
    // Page menu UI option
    let option = PageMenuOption(frame: CGRect(
      x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20))
    
    // Init Page Menu with view controllers and UI option
    pageMenu = PageMenuView(viewControllers: viewControllers, option: option)
    view.addSubview(pageMenu)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    pageMenu.frame = CGRect(x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20)
  }
}
