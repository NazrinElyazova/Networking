//
//  UserDetailsController.swift
//  Networking
//
//  Created by Nazrin on 29.11.23.
//

import UIKit

class UserDetailsController: UIViewController {
    
    var item: Users?
    
    @IBOutlet weak var geoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userDetails = item {
            usernameLabel.text = userDetails.username
            emailLabel.text = userDetails.email
            phoneLabel.text = userDetails.phone
            
            if let addressDetails = userDetails.address {
                addressLabel.text = "\(addressDetails.street ?? ""), \(addressDetails.city ?? ""), \(addressDetails.suite ?? ""), \(addressDetails.zipcode ?? "")"
                
                if let geoDetails = addressDetails.geo {
                    geoLabel.text = "\(geoDetails.lat ?? ""), \(geoDetails.lng ?? "")"
                    
                    if let companyDetails = userDetails.company {
                        companyLabel.text = "\(companyDetails.bs ?? ""), \(companyDetails.catchPhrase ?? ""), \(companyDetails.name ?? "")"
                    }
                }
                
            }
        }
    }
}
