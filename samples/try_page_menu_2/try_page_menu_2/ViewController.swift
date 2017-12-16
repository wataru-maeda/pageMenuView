//
//  ViewController.swift
//  try_page_menu_2
//
//  Created by Wataru Maeda on 2017/12/15.
//  Copyright © 2017 com.watarumaeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var pageMenu: PageMenuView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Presenting View Contollers
    let viewController1 = ChildViewController()
    viewController1.title = "Child View 1"
    let viewController2 = ChildViewController()
    viewController2.title = "Child View 2"
    let viewController3 = ChildViewController()
    viewController3.title = "Child View 3"
    
    // Added to the array
    let viewControllers = [viewController1, viewController2, viewController3]
    
    // Init Page Menu
    pageMenu = PageMenuView(viewControllers: viewControllers,
                            option: PageMenuOption(frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20)))
    view.addSubview(pageMenu)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    pageMenu.frame = CGRect(x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20)
  }
}
