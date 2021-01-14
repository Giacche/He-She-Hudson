//
//  prodCollectionViewCell.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 03/05/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit

class prodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var prodImage: UIImageView!
    @IBOutlet weak var prodName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prodImage.layer.cornerRadius = 15
        prodImage.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        prodImage.image = nil
    }
    
}
