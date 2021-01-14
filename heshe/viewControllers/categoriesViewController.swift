//
//  categoriesViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 31/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCrashlytics
import FirebaseAnalytics

class categoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var categoriesArrayList = [RootClass]()
    
    var productArrayCat = [product]()
    
    var filtered = [product]()
    
    var nameCat: String!
    

    @IBAction func closeCat(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filtered.removeAll()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! productsViewController
        vc.prodArrayList = filtered
        vc.segueName = nameCat
    }
    
    
}

extension categoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return categoriesArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: catCell.xibName, for: indexPath) as! catCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let catCell = cell as? catCell{
            catCell.loadCat(withCat: self.categoriesArrayList[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath){
            
            for i in 0..<productArrayCat.count{
                for y in 0..<productArrayCat[i].categories.count{
                    if(productArrayCat[i].categories[y].slug == self.categoriesArrayList[indexPath.row].slug){
                        filtered.append(productArrayCat[i])
                    }
                }
            }
            
            let parameter = ["heshe_category_name": self.categoriesArrayList[indexPath.row].name!] as [String : Any]
            Analytics.logEvent("heshe_category", parameters: parameter)
                
            nameCat = self.categoriesArrayList[indexPath.row].name!
            print(nameCat!)
            self.performSegue(withIdentifier: "catToProds", sender: self)
        }
    }
    
}
