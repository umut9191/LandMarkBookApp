//
//  imageViewController.swift
//  LandMarkBookApp
//
//  Created by Mac on 26.12.2021.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedLandMarkImage
        myLabel.text = selectedLandMarkName

    }
}
