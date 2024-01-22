//
//  CommentController.swift
//  Networking
//
//  Created by Nazrin on 27.11.23.
//

import UIKit

class CommentController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    var items = [Comment]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "CommentCell", bundle: nil), forCellWithReuseIdentifier: "CommentCell")
        getComments()
    }
    
    func getComments() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let items = try JSONDecoder().decode(CommentItem.self, from: data!)
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
extension CommentController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCell", for: indexPath) as! CommentCell
        cell.nameLabel.text = items[indexPath.item].name
        cell.bodyLabel.text = items[indexPath.item].body
        cell.emailLabel.text = items[indexPath.item].email
//        cell.vc?.delegate = self
        return cell
    }
    
    
}
