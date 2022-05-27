//
//  Burger.swift
//  Meal of the day
//
//  Created by Isiah Parra on 5/25/22.
//

import UIKit

enum BurgerListKeys: String {
    case kURLString = "image"
}



class Burger {
    var image: String
    init (image: String) {
        self.image = image
    }
    
    
}// end of class

//extension Burger {
//    convenience init?(burgerDictionary: [String:String]) {
//        guard let image = burgerDictionary[BurgerListKeys.kURLString.rawValue] else{return nil}
//        self.init(image:image)
//    }
//}
