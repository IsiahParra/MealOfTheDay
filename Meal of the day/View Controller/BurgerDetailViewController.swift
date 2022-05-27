//
//  BurgerDetailViewController.swift
//  Meal of the day
//
//  Created by Isiah Parra on 5/25/22.
//

import UIKit

class BurgerDetailViewController: UIViewController {
    
//
    @IBOutlet weak var burgerImage: UIImageView!
    
    //reciever
//    var burger: Burger? {
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        BurgerController.fetchBurgerList { success in
            if success == true {
                guard let burger = BurgerController.burger else {return}
                BurgerController.fetchImage(with: burger) { image in
                    guard let image = image else {return}
                    self.updateViews(with: image)
                }
            }
        }
    }
    
    
    
    
    func updateViews(with image: UIImage) {
        DispatchQueue.main.async {
            self.burgerImage.image = image
        }
    }
    @IBAction func reFreshButtonTapped(_ sender: Any) {
        BurgerController.fetchBurgerList { success in
            if success == true {
                guard let burger = BurgerController.burger else {return}
                BurgerController.fetchImage(with: burger) { image in
                    guard let image = image else {return}
                    self.updateViews(with: image)
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
