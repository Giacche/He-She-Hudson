//
//  catCollectionViewCell.swift
//  elegancejardin
//
//  Created by Lucas Giacche on 02/05/2020.
//  Copyright © 2020 Lucas Giacche. All rights reserved.
//

import UIKit

class catCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        catImage.layer.cornerRadius = 15
        catImage.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        catImage.image = nil
    }

}
