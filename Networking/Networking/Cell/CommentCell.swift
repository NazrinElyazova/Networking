//
//  CommentCell.swift
//  Networking
//
//  Created by Nazrin on 27.11.23.
//

import UIKit

class CommentCell: UICollectionViewCell {
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
