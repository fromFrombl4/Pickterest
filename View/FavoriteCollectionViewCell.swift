//
//  FavoriteCollectionViewCell.swift
//  Pickterest
//
//  Created by Roman Dod on 8/29/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var favorite: FavoriteCell? {
        didSet{
            nameLabel.text = favorite?.name
            if let image = favorite?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
