//
//  BurgerController.swift
//  Meal of the day
//
//  Created by Isiah Parra on 5/25/22.
//

import Foundation
import UIKit

class BurgerController {
    static var burger: Burger?
    
static private let baseURLString = "https://foodish-api.herokuapp.com"
static private let apiComponent = "api/images"
static private let burgerComponent = "burger"
    
    static func fetchBurgerList(completion: @escaping (Bool) -> Void){
        guard let baseURL = URL(string: baseURLString) else {return}
        let imageURL = baseURL.appendingPathComponent(apiComponent)
        let finalURL = imageURL.appendingPathComponent(burgerComponent)
        
        URLSession.shared.dataTask(with: finalURL) { burgerData, _, error in
            if let error = error {
                print("Theres been an error!!!", error.localizedDescription)
                completion(false)
                return
            }
            guard let burgerData = burgerData else {
                completion(false)
                return
            }
            do {
                print(burgerData)
                if let burgerDict = try JSONSerialization.jsonObject(with: burgerData, options: .fragmentsAllowed) as? [String:String] {
                    guard let burgerDetail = burgerDict["image"] else {
                        completion(false)
                        return
                    }
                    print(burgerDetail)
                    self.burger = Burger(image: burgerDetail)
                    completion(true)
                }
            }catch{
                print("Oh no theres been an error trying to Decode the burger detail")
                completion(false)
            }

        }.resume()
    }
    static func fetchImage(with burger: Burger , completion: @escaping (UIImage?) -> Void) {
        
               guard let imageURL = URL(string: burger.image) else {return}
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("Theres been an error!!!", error.localizedDescription)
                completion(nil)
                return
            }
            if let data = data{
             guard let image = UIImage(data: data) else{completion(nil);return}
                completion(image)
            }
    }.resume()
    }
    
    
}// end of class
