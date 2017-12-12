//
//  AnimalListViewController.swift
//  try_page_menu
//
//  Created by Wataru Maeda on 2017/12/10.
//  Copyright © 2017 com.wataru.maeda. All rights reserved.
//

import UIKit

struct Animal {
  
  var image: String!
  var name: String!
  var details: String!
  
  init(image: String, name: String, details: String) {
    self.image = image
    self.name = name
    self.details = details
  }
}

class AnimalListViewController: UIViewController {
  
  private var animals = [Animal]()
  let cellId = "AnimalTableViewCell"
  
  @IBOutlet var tableView: UITableView! {
    didSet {
      tableView.rowHeight = 100
      tableView.delegate = self
      tableView.dataSource = self
    }
  }
  
  class func initFromStoryboard(animals: [Animal]) -> AnimalListViewController {
    let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
    let animalViewController = storyboard.instantiateViewController(
      withIdentifier: "AnimalListViewController") as! AnimalListViewController
    animalViewController.setAnimals(animals: animals)
    return animalViewController
  }
  
  func setAnimals(animals: [Animal]) {
    self.animals = animals
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableHeaderView = getHeader()
    tableView.reloadData()
  }
  
  func getHeader() -> UIView {
    let headerView = UIView()
    headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250)
    let imageView = UIImageView()
    imageView.image = UIImage(named: animals.first!.image)
    imageView.contentMode = .scaleAspectFill
    imageView.frame = headerView.bounds
    imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    imageView.clipsToBounds = true
    headerView.addSubview(imageView)
    return headerView
  }
}

extension AnimalListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! AnimalTableViewCell
    cell.setupView(animal: animals[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }
}

class AnimalTableViewCell: UITableViewCell {
  
  @IBOutlet var animalImageView: UIImageView! {
    didSet {
      animalImageView.layer.cornerRadius = 10
      animalImageView.clipsToBounds = true
    }
  }
  @IBOutlet var animalNameLabel: UILabel!
  @IBOutlet var animalDetailLabel: UILabel!
  
  func setupView(animal: Animal) {
    animalImageView.image = UIImage(named: animal.image)
    animalNameLabel.text = animal.name
    animalDetailLabel.text = animal.details
  }
}
