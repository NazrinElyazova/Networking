//
//  PhotoController.swift
//  Networking
//
//  Created by Nazrin on 27.11.23.
//

import UIKit

class PhotoController: UIViewController {
    
    var items = [Photo]()
    
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPhoto()
        title = "Photos"
        collection.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }
    func getPhoto() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let items = try JSONDecoder().decode(PhotoItems.self, from: data!)
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
extension PhotoController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photo = items[indexPath.item]
        cell.labelPhoto.text = photo.title
        
        cell.imagePhoto.downloaded(from: photo.url ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "NextPhotoController") as! NextPhotoController
        controller.example = items[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let type = response.mimeType, type.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {return}
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else {return}
        downloaded(from: url, contentMode: mode)
    }
}
