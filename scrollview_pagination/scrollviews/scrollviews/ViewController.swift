//
//  ViewController.swift
//  scrollviews
//
//  Created by Luciano de Castro Martins on 22/09/17.
//  Copyright © 2017 Luciano de Castro Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var slideScrollView: UIScrollView!
    let feature1 = ["title" : "Apple Whatch", "price" : "0,99", "image" : "watch"]
    let feature2 = ["title" : "More Designs", "price" : "5,99", "image" : "settings"]
    let feature3 = ["title" : "Notifications", "price" : "10,99", "image" : "palete"]
    
    var featureArray = [[String : String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        slideScrollView.delegate = self
        
        featureArray = [feature1, feature2, feature3]
        slideScrollView.isPagingEnabled = true
        slideScrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(featureArray.count), height: 250)
        slideScrollView.showsHorizontalScrollIndicator = false
        loadFeatures()
        
    }
    
    func loadFeatures() {
        for (index, feature) in featureArray.enumerated() {
            if let featureView = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first
                as? Feature {
                featureView.titleLabel.text = feature["title"]
                featureView.priceLabel.text = feature["price"]
                featureView.image.image = UIImage(named: feature["image"]!)
                featureView.frame.size.width = view.bounds.size.width
                featureView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                slideScrollView.addSubview(featureView)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = slideScrollView.contentOffset.x / slideScrollView.frame.size.width
        pageControll.currentPage = Int(page)
    }
}

