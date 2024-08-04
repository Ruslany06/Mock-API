//
//  ViewController.swift
//  Mock API
//
//  Created by Ruslan Yelguldinov on 03.08.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import SVProgressHUD

class MyTableViewCell: UITableViewCell {

    override class func awakeFromNib() {
        super .awakeFromNib()
        
    }

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var habitatLabel: UILabel!
    @IBOutlet weak var dietLabel: UILabel!
    
    func setData(animal: AnimalModel) {
        
        nameLabel.text! = animal.name
        speciesLabel.text! = animal.species
        habitatLabel.text! = animal.habitat
        dietLabel.text! = animal.diet
        
//        animalImageView.sd_setImage(with: URL(string: animal.photoURL))
        if let url = URL(string: animal.photoURL) {
            animalImageView.sd_setImage(with: url)
        } else {
            animalImageView.image = .resort5 // Установите placeholder или очистите изображение
        }
    }
    
    
}

