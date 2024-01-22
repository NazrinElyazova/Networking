//
//  PostController.swift
//  Networking
//
//  Created by Nazrin on 25.11.23.
//

import UIKit

class PostController: UIViewController {
    var items = [Post]()
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPostItems()
        collection.register(UINib(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: "PostCell")
    }
    
    func getPostItems() {
        guard let url = URL(string: "\(baseURL)/posts") else{return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    self.items = try JSONDecoder().decode(PostItem.self, from: data!)
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
extension PostController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.bodyLabel.text = items[indexPath.item].body
        cell.titleLabel.text = items[indexPath.item].title
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CommentController") as! CommentController
        navigationController?.pushViewController(controller, animated: true)
    }
}
