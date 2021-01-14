//
//  prodCell.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 31/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit
import SwiftSoup
import Firebase
import FirebaseCrashlytics
import FirebaseAnalytics

class prodCell: UITableViewCell {
    
    var producto : product!
    
    static let xibName = "prodCell"
    
    @IBOutlet weak var imageProd: UIImageView!
    @IBOutlet weak var nameProd: UILabel!
    @IBOutlet weak var catProd: UILabel!
    
    @IBOutlet weak var priceProd: UILabel!
    
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var cantProd: UILabel!
    
    var initCant : Int!
    
    @IBAction func addOrder(_ sender: Any) {
        
        if(producto.cantOr! == 0){
            Constants.order.orderProducts.append(producto)
        }
        
        producto.cantOr += 1
        cantProd!.text = "\(producto.cantOr!)"
        
        
        let numberStringProd = (producto.price!)
        let numberFromStringProd = Int(numberStringProd)
        Constants.order.countOrder += numberFromStringProd!
        
        NotificationCenter.default.post(name: Notification.Name("reloadTotal"), object: nil, userInfo: ["Total" : "Total"])
            
        let parameter = ["heshe_product_name": producto.name!] as [String : Any]
        Analytics.logEvent("heshe_add_product", parameters: parameter)
    }
    
    @IBAction func subsOrder(_ sender: Any) {
        if(producto.cantOr > 0){
            producto.cantOr -= 1
            cantProd!.text = "\(producto.cantOr!)"
            
            let numberStringProd = (producto.price!)
            let numberFromStringProd = Int(numberStringProd)
            Constants.order.countOrder -= numberFromStringProd!
            
            NotificationCenter.default.post(name: Notification.Name("reloadTotal"), object: nil, userInfo: ["Total" : "Total"])
            
            if(producto.cantOr! == 0){
                Constants.order.orderProducts = Constants.order.orderProducts.filter {$0 != producto}
            }
                        
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageProd.layer.cornerRadius = 15
        imageProd.layer.cornerRadius = 15
        imageProd.clipsToBounds = true
        imageProd.clipsToBounds = true
        orderView.layer.cornerRadius = 10
        
        //initCant = 0
    }

    override func prepareForReuse() {
        imageProd.image = nil
    }
    
    func loadProd(withProd producto: product){
        
        let htmlContent = producto.shortDescription!
        
        
        do{
            let doc = try SwiftSoup.parse(htmlContent)
            
            do{
                self.catProd.text = try doc.select("p").first()?.text()
            }catch{
                
            }
            
        }catch{
            
        }
        
        if(producto.cantOr! != nil){
            cantProd.text = "\(producto.cantOr!)"
        }
        let numberString = (producto.regularPrice!)
        let numberFromString = Int(numberString)
        let numberStringSale = (producto.salePrice!)
        let numberFromStringSale = Int(numberStringSale)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "es_CL")
        self.producto = producto
        self.imageProd.image = UIImage(named: "camera_hover_big")
        self.nameProd.text = producto.name
        self.priceProd.text = formatter.string(from: NSNumber(value: numberFromString!))
        if(producto.images.count == 0){
            self.imageProd.image = UIImage(named: "camera_hover_big")
        }else{
            self.imageProd.af_setImage(withURL: URL(string: producto.images[0].src)!)
        }
        
        
    }

}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
