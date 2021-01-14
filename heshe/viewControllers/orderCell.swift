//
//  orderCell.swift
//  heshehudson
//
//  Created by Lucas Giacche on 18/06/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit

class orderCell: UITableViewCell {
    
    @IBOutlet weak var orderImg: UIImageView!
    @IBOutlet weak var orderProdName: UILabel!
    @IBOutlet weak var orderProdCant: UILabel!
    @IBOutlet weak var orderProdSubTotal: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        orderImg.layer.cornerRadius = 15
        orderImg.layer.cornerRadius = 15
        orderImg.clipsToBounds = true
        orderImg.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        orderImg.image = nil
    }
    
    func loadProd(withProd producto: product){
        
        let numberStringSale = (producto.price)
        let numberFromStringSale = Int(numberStringSale!)
        
        self.orderProdName.text = producto.name
        self.orderProdCant.text = "X\(producto.cantOr!)"
        orderProdSubTotal.text = "$\(numberFromStringSale! * producto.cantOr)"
        
        if(producto.images.count == 0){
            self.orderImg.image = UIImage(named: "cam_cat")
        }else{
            self.orderImg.af_setImage(withURL: URL(string: producto.images[0].src)!)
        }
    }

}
