//
//  DetailCoffeViewController.swift
//  GoCoffee2
//
//  Created by Admin on 25/08/22.
//

import UIKit

class DetailCoffeViewController: UIViewController {

    //Variável que recebe o item clicado da homeviewcontroller
    var coffee: CoffeeModel?
    
    @IBOutlet weak var imageCoffee: UIImageView!
    @IBOutlet weak var descriptionCoffee: UITextView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let coffee = coffee {
            self.imageCoffee.image = UIImage(named: coffee.image)
            self.descriptionCoffee.text = coffee.description
            title = coffee.title
        }
       
    }
    
    @IBAction func favorite(_ sender: Any) {
            favoriteButton.image = .init(systemName: "staroflife.fill")
            
    }


    
}
