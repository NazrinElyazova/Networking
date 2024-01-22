//
//  NextPhotoController.swift
//  Networking
//
//  Created by Nazrin on 28.11.23.
//

import UIKit

class NextPhotoController: UIViewController {
    
    var example: Photo?
    
    @IBOutlet weak var nextPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageUrl = example?.url, let mainUrl = URL(string: imageUrl) {
            nextPhoto.downloaded(from: mainUrl)
        }
    }
}
