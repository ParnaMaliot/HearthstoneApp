//
//  APIManager.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/21/20.
//

import UIKit
import Alamofire
import Kingfisher

class APIManager {
    
    static let shared = APIManager()
    init() {}
    
    func getCard(id: String ,completion: @escaping(_ card: Card?, _ error: Error? ) -> ()) {
        let urlCard = URL_BASE + id
        
        AF.request(urlCard, headers: headers).responseDecodable(of: [Card].self) {response in
            if let error = response.error {
                print(error)
                completion(nil,error)
                return
            }
            if let card = response.value?.first{
                completion(card, nil)
                print(card)
            }
        }
        
    }
    
    func getAllCards(completion: @escaping(_ cards: [Card]?, _ error: Error?) -> ()) {
        let urlCards = URL_BASE
        
        AF.request(urlCards, headers: headers).responseDecodable(of: Cards.self) {response in
            if let error = response.error {
                completion(nil, error)
                print(error)
                return
            }
            if let cards = response.value?.basic {
                completion(cards, nil)
                print(cards)
            }
        }
        
    }
    
    func getCardsByCategory(completion: @escaping(_ categories: CardsByCategory?, _ error: Error?) -> ()) {
        let url = URL_BASE_CATEGORIES
        AF.request(url, headers: headers).responseDecodable(of: CardsByCategory.self) { response in
            if let error = response.error {
                completion(nil, error)
                print(error.localizedDescription)
            }
            if let cardByCategory = response.value {
                completion(cardByCategory, nil)
            }
        }
    }
    
    func categoriesCards(completion: @escaping(_ json: [String:Any]?, _ error: Error?) -> ()) {
        let url = URL_BASE_CATEGORIES
        AF.request(url, headers: headers).responseJSON { response in
        if let errror = response.error {
            completion(nil, errror)
            print(errror.localizedDescription)
        }
            if let jsonData = response.value, let json = jsonData as? [String:Any] {
                completion(json, nil)
            }
        }
    }
    
    func goFurther(name: String, type: String, completion: @escaping(_ card: [Card]?, _ error: Error?) -> ()) {
        let url = URL_BASE + type.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "/" + name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        AF.request(url, headers: headers).responseDecodable(of: [Card].self) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let cards = response.value {
                completion(cards, nil)
            }
        }
    }
    
    func setupImage(completion: @escaping(_ image: UIImage?, _ error: Error?) -> ()) {
        let urlImage = URL_IMAGE
        
        AF.request(urlImage).responseData { (response) in
            if let data = response.data {
                let image = UIImage(data: data)
                completion(image, nil)
            }
        }
        
//        AF.request(urlImage).responseDecodable(of: Card.self) { response in
//            if let error = response.error {
//                completion(nil, error)
//                return
//            }
//            if let card = response.value {
//                completion(card, nil)
//            }
//        }
    }

        
    let URL_BASE_CATEGORIES = "https://rapidapi.p.rapidapi.com/info/"
    let URL_BASE = "https://rapidapi.p.rapidapi.com/cards/"
    let URL_IMAGE = "https://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png"
    
    let headers: HTTPHeaders = [
    "x-rapidapi-host" : "omgvamp-hearthstone-v1.p.rapidapi.com",
    "x-rapidapi-key": "9adb1e1999msh88e589a4ea778bdp1b73a4jsnbb56b57222eb"
    ]
 
    
}
