//
//  CategoriesTableViewCell.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/25/20.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    
    func setupLabels() {
        lblCategories.layer.cornerRadius = 10
    }
    
    @IBOutlet weak var lblCategories: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
