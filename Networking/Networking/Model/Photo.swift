//
//  Photo.swift
//  Networking
//
//  Created by Nazrin on 27.11.23.
//

import Foundation
typealias PhotoItems = [Photo]

struct Photo: Codable {
    let title: String?
    let url: String?
}
