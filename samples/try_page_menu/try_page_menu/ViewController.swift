//
//  ViewController.swift
//  try_page_menu
//
//  Created by Wataru Maeda on 2017/11/28.
//  Copyright © 2017 com.wataru.maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initPageMenu()
  }
  
  func initPageMenu() {
    let viewControllers = getViewControllers()
    let option = getPageMenuOption()
    let pageMenu = PageMenuView(
      viewControllers: viewControllers,
      option: option)
    pageMenu.delegate = self
    pageMenu.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview(pageMenu)
  }
}

// MARK: - PageMenuViewDelegate

extension ViewController: PageMenuViewDelegate {
  
  func willMoveToPage(_ pageMenu: PageMenuView, from viewController: UIViewController, index currentViewControllerIndex: Int) {
    print(viewController.title!)
  }
  
  func didMoveToPage(_ pageMenu: PageMenuView, to viewController: UIViewController, index currentViewControllerIndex: Int) {
    print(viewController.title!)
    print("---")
  }
}

// MARK: - Model

extension ViewController {
  
  func getPageMenuOption() -> PageMenuOption {
    var option = PageMenuOption(frame:
      CGRect(x: 0, y: 20,
             width: view.frame.size.width,
             height: view.frame.size.height - 20))
    option.menuItemHeight = 44
    option.menuTitleFont = .boldSystemFont(ofSize: 16)
    option.menuTitleColorNormal = .lightGray
    option.menuTitleColorSelected = .black
    option.menuItemBackgroundColorNormal = .white
    option.menuItemBackgroundColorSelected = .white
    option.menuIndicatorColor = .black
    return option
  }
  
  func getViewControllers() -> [AnimalListViewController] {
    var viewControllers = [AnimalListViewController]()
    for name in ["dolphin", "whale", "turtle", "shark", "stingray", "dolphin", "whale", "turtle", "shark", "stingray"] {
      let animals = getAnimals(name: name)
      let animalViewController = AnimalListViewController.initFromStoryboard(animals: animals)
      animalViewController.title = name
      viewControllers.append(animalViewController)
    }
    return viewControllers
  }
  
  func getAnimals(name: String) -> [Animal] {
    var animals = [Animal]()
    for i in 0...6 {
      let animal = Animal(
        image: "\(name)\(i)",
        name: "\(name)(\(i+1))",
        details: "Explore the \(name) list to learn fun facts and more about your favorite marine life. ")
      animals.append(animal)
    }
    return animals
  }
}
