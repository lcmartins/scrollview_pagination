//
//  Slide.swift
//  scrollviews
//
//  Created by Luciano de Castro Martins on 22/09/17.
//  Copyright © 2017 Luciano de Castro Martins. All rights reserved.
//

import UIKit

class Feature: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        shadowView.layer.masksToBounds = false
        shadowView.layer.cornerRadius = 4
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowOpacity = 0.12
    }
    
}
