//
//  catCell.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 31/03/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit

class catCell: UITableViewCell {
    
    var categories : RootClass!
    
    static let xibName = "catCell"
    
    @IBOutlet weak var imageCat: UIImageView!
    @IBOutlet weak var nameCat: UILabel!
    @IBOutlet weak var descCat: UILabel!
    @IBOutlet weak var cantProds: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imageCat.layer.cornerRadius = 15
        imageCat.clipsToBounds = true
        cantProds.isHidden = true
    }

    override func prepareForReuse() {
        imageCat.image = nil
    }

    func loadCat(withCat categories:RootClass){
        self.categories = categories
        self.imageCat.image = UIImage(named: "camera_hover_big")
        self.nameCat.text = categories.name!
        self.descCat.text = categories.descriptionField!
        self.cantProds.text = "\(categories.count!) productos en esta categoría"
        
        if(categories.image == nil){
            self.imageCat.image = UIImage(named: "camera_hover_big")
        }else{
            self.imageCat.af_setImage(withURL: URL(string: categories.image.src!)!)
        }
    }
}
