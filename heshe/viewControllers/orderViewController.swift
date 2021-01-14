//
//  orderViewController.swift
//  heshehudson
//
//  Created by Lucas Giacche on 18/06/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCrashlytics
import FirebaseAnalytics

class orderViewController: UIViewController {
    
    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var doOrder: UIButton!
    
    @IBOutlet weak var titleSection: UILabel!
    
    @IBOutlet weak var noProductsView: UIView!
    @IBOutlet weak var confirmView: UIView!
    
    var textoToShare : String!
    
    
    @IBAction func closeBtnAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doOrderAction(_ sender: Any) {
        
        let todaysDate: NSDate = NSDate()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateInFormat:String = dateFormatter.string(from: todaysDate as Date)
                
        if(dateInFormat > "17:00" && dateInFormat < "21:30"){
            let alertController = UIAlertController(title: "Atención", message: "Luego de realizar el pedido aguarda nuestra confirmación, te avisaremos el horario de retiro para tu pedido.", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Continuar", style: .default, handler: {(action: UIAlertAction!) in
                self.textoToShare = ""
                
                for i in 0..<Constants.order.orderProducts.count{
                    self.textoToShare = self.textoToShare + "\n - " + Constants.order.orderProducts[i].name + " " + "X\(Constants.order.orderProducts[i].cantOr!)" + " " + "$\(Int(Constants.order.orderProducts[i].price!)! * Constants.order.orderProducts[i].cantOr!)"
                }
                
                
                let urlWhats = "https://wa.me/5491165005932?text=¡Hola He-She! Mi pedido es: \(self.textoToShare!) \n • Precio de lista: $\(Constants.order.countOrder) \n • Precio en efectivo: $\(Constants.order.countOrder - ((Constants.order.countOrder * 15) / 100))"
                
                if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                    if let whatsappURL = URL(string: urlString) {
                        if UIApplication.shared.canOpenURL(whatsappURL) {
                            UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                        } else {
                            let alertController = UIAlertController(title: "Aviso", message: "Usted no posee WhatsApp instalada", preferredStyle: .alert)
                            let noAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                            alertController.addAction(noAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                }
                
                Analytics.logEvent("heshe_do_order", parameters: [:])
            })
            let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
            alertController.addAction(noAction)
            alertController.addAction(yesAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: "Atención", message: "Nuestro horario para recibir pedidos es de 17:00hs a 21:30hs", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(yesAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func deleteOrder(_ sender: Any) {
        let alertController = UIAlertController(title: "Eliminar pedido", message: "¿Desea eliminar su pedido? Se borraran todas sus selecciones", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Si", style: .default, handler: {(action: UIAlertAction!) in
            self.orderTableView.isHidden = true
            self.confirmView.isHidden = true
            self.titleSection.isHidden = true
            self.noProductsView.isHidden = false
            for i in 0..<Constants.order.orderProducts.count{
                Constants.order.orderProducts[i].cantOr = 0
            }
            Constants.order.countOrder = 0
            Constants.order.orderProducts = []
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textoToShare = ""
        
        doOrder.layer.cornerRadius = 10
        
        totalPrice.text = "$\(Constants.order.countOrder)"
        
        if(Constants.order.orderProducts.count == 0){
            orderTableView.isHidden = true
            confirmView.isHidden = true
            titleSection.isHidden = true
            noProductsView.isHidden = false
        }else{
            orderTableView.isHidden = false
            confirmView.isHidden = false
            titleSection.isHidden = false
            noProductsView.isHidden = true
        }

    }
    
    
    

}

extension orderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Constants.order.orderProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! orderCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let orderCell = cell as? orderCell{
            orderCell.loadProd(withProd: Constants.order.orderProducts[indexPath.row])
        }
    }
    
}
