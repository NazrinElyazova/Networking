//
//  Post.swift
//  Networking
//
//  Created by Nazrin on 26.11.23.
//

import Foundation

typealias PostItem = [Post]

struct Post: Codable {
    let userId, id: Int?
    let title, body: String?
}
