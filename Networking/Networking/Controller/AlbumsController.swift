//
//  AlbumsController.swift
//  Networking
//
//  Created by Nazrin on 29.11.23.
//

import UIKit

class AlbumsController: UIViewController {
    var album = [Album]()
    
    @IBOutlet weak var albumLabel: UILabel!
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAlbum()
        title = "Albums"
    }
    func getAlbum() {
        guard let url = URL(string: "https:jsonplaceholder.typicode.com/albums") else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let items = try JSONDecoder().decode([Album].self, from: data!)
                    self.album = items
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

extension AlbumsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        album.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AlbumTableViewCell.self)") as! AlbumTableViewCell
        cell.albumTableLabel.text = album[indexPath.row].title
        return cell
    }
}
