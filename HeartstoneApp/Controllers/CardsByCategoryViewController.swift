//
//  CardsByCategoryViewController.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/23/20.
//

import UIKit

class CardsByCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var cardsByCategory: CardsByCategory?
    var dataArray = [String]()
    var type: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
//        APIManager.shared.getCardsByCategory { (cardSet, error) in
//            if let cardSet = cardSet {
//                self.cardsByCategory = cardSet
//                self.categoryTableView.reloadData()
//            }
//        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let cardByCategory = cardsByCategory {
//            return cardByCategory.classes.count
//        }
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Categories") as! CategoriesTableViewCell
        let data = dataArray[indexPath.row]
        cell.lblCategories.text = data
        return cell
    }
    
    func registerCell() {
        categoryTableView.register(UINib(nibName: "CardsByCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
        categoryTableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "Categories")
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let name = dataArray[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "cardsViewController") as! ViewController
        controller.name = name
        controller.type = type
        navigationController?.pushViewController(controller, animated: true)
    }

}

