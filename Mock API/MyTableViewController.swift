//
//  TableViewController.swift
//  Mock API
//
//  Created by Ruslan Yelguldinov on 03.08.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import SVProgressHUD

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Test data
        /*
        let urlTest = "https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?cs=srgb&dl=pexels-pixabay-47547.jpg&fm=jpg"
        
        let animalTest = AnimalModel(photoURL: urlTest, name: "Test", species: "TestSp", habitat: "testHab", dietLabel: "TestDiet")
        let animalTest2 = AnimalModel(photoURL: urlTest, name: "Test2", species: "TestSp2", habitat: "testHab2", dietLabel: "TestDiet2")
        
        animalsArray.append(animalTest)
        animalsArray.append(animalTest2)
        tableView.reloadData()
        */
        
        fetchAnimalsData()
    }
    
    var animalsArray:[AnimalModel] = []
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animalsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        
        cell.setData(animal: animalsArray[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    //MARK: API request
    //-------->
    func fetchAnimalsData() {
            let url = "https://demo1190610.mockable.io/animal"
            
            // Показать индикатор загрузки
            SVProgressHUD.show()
            
            AF.request(url).responseJSON { response in
                SVProgressHUD.dismiss()
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.parseAnimalsData(json: json)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        func parseAnimalsData(json: JSON) {
            for animalJson in json.arrayValue {
                let animal = AnimalModel(
                    photoURL: animalJson["photo"].stringValue,
                    name: animalJson["name"].stringValue,
                    species: animalJson["species"].stringValue,
                    habitat: animalJson["habitat"].stringValue,
                    diet: animalJson["diet"].stringValue
                )
                animalsArray.append(animal)
            }
            tableView.reloadData()
        }
    //-------->
    
}
