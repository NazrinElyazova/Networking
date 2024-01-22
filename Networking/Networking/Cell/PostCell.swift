//
//  PostCell.swift
//  Networking
//
//  Created by Nazrin on 25.11.23.
//

import UIKit


class PostCell: UICollectionViewCell {

    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    weak var vc: UICollectionViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bodyLabel.layer.cornerRadius = 20
        titleLabel.layer.cornerRadius = 20
        postView.layer.cornerRadius = 20
    }
}



