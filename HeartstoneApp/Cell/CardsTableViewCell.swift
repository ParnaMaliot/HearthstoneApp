//
//  CardsTableViewCell.swift
//  HeartstoneApp
//
//  Created by Igor Parnadjiev on 10/21/20.
//

import UIKit

class CardsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCardSet: UILabel!
    @IBOutlet weak var lblCardType: UILabel!
    
        
    func setupCell(card: Card) {
        lblID.text = card.cardId
        lblName.text = card.name
        lblCardSet.text = card.cardSet
        lblCardType.text = card.type
        }

    
       
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
