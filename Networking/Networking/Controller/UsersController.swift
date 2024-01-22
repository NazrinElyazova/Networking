//
//  UsersController.swift
//  Networking
//
//  Created by Nazrin on 29.11.23.
//

import UIKit

class UsersController: UIViewController {
    
    var items = [Users]()
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        getUsers()
        collection.register(UINib(nibName: "UsersCell", bundle: nil), forCellWithReuseIdentifier: "UsersCell")
    }
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let items = try JSONDecoder().decode(UserItems.self, from: data!)
                    self.items = items
                    DispatchQueue.main.async {
                        self.collection.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
extension UsersController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersCell", for: indexPath) as! UsersCell
        cell.userEmail.text = items[indexPath.item].email
        cell.userName.text = items[indexPath.item].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "UserDetailsController") as! UserDetailsController
        controller.item = items[indexPath.item]
        navigationController?.show(controller, sender: nil)
     }
    
}
