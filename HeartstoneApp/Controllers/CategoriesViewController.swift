//
//  CategoriesViewController.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/25/20.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categories = [String]()
    var categoriesTwo = Categories()
    
    @IBOutlet weak var categoriesTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Categories") as! CategoriesTableViewCell
        let category = categories[indexPath.row]
        cell.lblCategories.text = category.capitalized
        cell.setupLabels()
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        APIManager.shared.categoriesCards { (categories, error) in
            if let categories = categories {
                self.parseData(json: categories)
            }
        }
        self.title = "I got this via google".uppercased()
        
    }
    
    func parseData(json: [String:Any]) {
        categories.append(contentsOf: json.keys)
        categories.removeAll(where: {$0 == "patch"})
        categories.removeAll(where: {$0 == "locales"})
        let decoder = JSONDecoder()
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            categoriesTwo = try decoder.decode(Categories.self, from: data)
            categoriesTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func registerCell() {
        categoriesTableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "Categories")
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = categories[indexPath.row]
        let dataArray = categoriesTwo.getArrayForKey(input: category)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CardsByCategoryViewController") as! CardsByCategoryViewController
        controller.dataArray = dataArray
        controller.type = category
        
        if category == "wild" || category == "result"{
            controller.type = "sets"
        }

        navigationController?.pushViewController(controller, animated: true)
    }
    
}
