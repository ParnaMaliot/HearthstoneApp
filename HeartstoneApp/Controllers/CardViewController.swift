//
//  CardViewController.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/22/20.
//

import UIKit
import Kingfisher
let URL_IMAGE = "https://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png"

class CardViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCardSet: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblCardText: UILabel!
    @IBOutlet weak var lblClass: UILabel!
    @IBOutlet weak var imgViewSecond: UIImageView!
    
    var card = Card()
    var imageCard = Card()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        APIManager.shared.getCard(id: card.cardId!) { (card, error) in
             if let card = card {
                 self.setupCard(card: card)
             }
         }
    
//        imgView.kf.setImage(with: URL(string: URL_IMAGE))
        self.imgViewSecond.kf.setImage(with: URL(string: URL_IMAGE))

    }
    
    func flipImageView() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: imgViewSecond, duration: 1.0, options: transitionOptions, animations: {
                 self.imgViewSecond.isHidden = true
             })
         UIView.transition(with: imgView, duration: 1.0, options: transitionOptions, animations: {
             self.imgView.isHidden = false
         })

     
    }

    func setupLayout() {
        lblID.layer.cornerRadius = 10
        lblID.layer.masksToBounds = true
        lblID.font.withSize(10)
        lblName.layer.cornerRadius = 10
        lblName.layer.masksToBounds = true
        lblName.adjustsFontForContentSizeCategory = true
        lblCardSet.layer.cornerRadius = 10
        lblCardSet.layer.masksToBounds = true
        lblClass.layer.cornerRadius = 10
        lblClass.layer.masksToBounds = true
        lblCardText.layer.cornerRadius = 10
        lblCardText.layer.masksToBounds = true
        lblClass.layer.cornerRadius = 10
        lblClass.layer.masksToBounds = true
    }
    
func setupCard(card: Card) {
    lblID.text = card.cardId
    lblName.text = card.cardText
    lblCardSet.text = card.cardText
    lblClass.text = card.playerClass
    lblType.text = card.type

    

    if let url = card.image {
        self.imgView.kf.setImage(with: URL(string: url))
        self.imgView.isHidden = true
        imgViewSecond.isHidden = false
        flipImageView()

    }

    //        APIManager.shared.getImageForCard(id: card.cardId!) { (card, error) in
    //            if let imageName = card?.cardId {
    //                let imageURL = "http://media.services.zam.com/v1/media/byName/hs/cards/enus/" + imageName + ".png"
    //                self.imgView.kf.setImage(with: URL(string: imageURL))
    //
    //            }
    //        }
}


}


