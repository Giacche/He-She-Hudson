//
//  productsViewController.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 31/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit

class productsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var prodArrayList = [product]()
    
    var segueName: String!
    
    var currentIndex: Int!
    
    @IBOutlet weak var catsName: UILabel!
    
    @IBOutlet weak var seeOrder: UIButton!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBAction func closeProd(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seeOrder.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.ReceivedNotification(notification:)), name: Notification.Name("reloadTotal"), object: nil)
        
    }
    
    @objc func ReceivedNotification(notification: Notification){
        totalAmount.text = "$\(Constants.order.countOrder)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //prodArrayList.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        totalAmount.text = "$\(Constants.order.countOrder)"
    }
    
}

extension productsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return prodArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: prodCell.xibName, for: indexPath) as! prodCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let prodCell = cell as? prodCell{
            prodCell.loadProd(withProd: self.prodArrayList[indexPath.row])
        }
    }
    
}
