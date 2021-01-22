//
//  ViewController.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/21/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var lblNotFound: UILabel!
    
    var cards = [Card]()
    var name: String = ""
    var type: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        lblNotFound.isHidden = true
        lblNotFound.layer.cornerRadius = 10
        lblNotFound.layer.masksToBounds = true
        
        APIManager.shared.goFurther(name: name, type: type) { (cards, error) in
            if let cards = cards {
                self.cards = cards
                self.tableView.reloadData()
                if cards.isEmpty {
                    self.lblNotFound.isHidden = false
                    self.tableView.isHidden = true
                    self.lblNotFound.text = "No data found"
                }
            }

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardsCell") as! CardsTableViewCell
        let displayedCard = cards[indexPath.row]
        cell.setupCell(card: displayedCard)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CardsTableViewCell", bundle: nil), forCellReuseIdentifier: "CardsCell")
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayedCard = cards[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        controller.card = displayedCard
        navigationController?.pushViewController(controller, animated: true)
            }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            let controller = segue.destination as! CardViewController
            controller.card = sender as! Card
        }
    }

}

